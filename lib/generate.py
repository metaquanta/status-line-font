#!/bin/python3

import fontforge
import os
import subprocess
import tempfile
import json
import math

#
# Manifest / Options
# Older Pythons don't have argparse, so we use optparse instead
#

try:
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('manifest', help='Path to .fontcustom-manifest.json')
    args = parser.parse_args()
    manifestfile = open(args.manifest, 'r+')
except ImportError:
    import optparse
    parser = optparse.OptionParser()
    (nothing, args) = parser.parse_args()
    manifestfile = open(args[0], 'r+')

manifest = json.load(manifestfile)
options = manifest['options']

#
# Font
#

design_px = options['font_em'] / options['font_design_size']

font = fontforge.font()
font.encoding = 'UnicodeFull'
font.design_size = options['font_design_size']
font.em = options['font_em']
font.ascent = options['font_ascent']
font.descent = options['font_descent']
font.fontname = options['font_name']
font.familyname = options['font_name']
font.fullname = options['font_name']
font.copyright = options['copyright']

#
# Glyphs
#

def removeSwitchFromSvg( file ):
    svgfile = open(file, 'r')
    svgtext = svgfile.read()
    svgfile.close()
    tmpsvgfile = tempfile.NamedTemporaryFile(suffix=".svg", delete=False)
    svgtext = svgtext.replace('<switch>', '')
    svgtext = svgtext.replace('</switch>', '')
    tmpsvgfile.file.write(svgtext.encode('utf-8'))
    tmpsvgfile.file.close()

    return tmpsvgfile.name

def createGlyph( name, source, code ):
    frag, ext = os.path.splitext(source)

    if ext == '.svg':
        temp = removeSwitchFromSvg(source)
        glyph = font.createChar(code, name)
        glyph.importOutlines(temp)
        os.unlink(temp)
        width = glyph.width - glyph.left_side_bearing - glyph.right_side_bearing
        glyph.width = options['font_width'] * math.ceil(width/options['font_width'])

# Add valid space glyph to avoid "unknown character" box on IE11
glyph = font.createChar(32)
glyph.width = options['font_width']

for glyph, data in manifest['glyphs'].items():
    name = createGlyph(glyph, data['source'], data['codepoint'])

#
# Generate Files
#

try:
    fontfile = options['font_name']
    if not options['no_hash']:
        fontfile += '_' + manifest['checksum']['current'][:32]

    # Generate TTF and SVG
    font.generate(fontfile + '.ttf')
    font.generate(fontfile + '.svg')

    # Fix SVG header for webkit
    # from: https://github.com/fontello/font-builder/blob/master/bin/fontconvert.py
    svgfile = open(fontfile + '.svg', 'r+')
    svgtext = svgfile.read()
    svgfile.seek(0)
    svgfile.write(svgtext.replace('''<svg>''', '''<svg xmlns="http://www.w3.org/2000/svg">'''))
    svgfile.close()

    # Convert WOFF
    scriptPath = os.path.dirname(os.path.realpath(__file__))
    try:
        # check if on windows
        if os.name == 'nt':
            subprocess.Popen([scriptPath + '/sfnt2woff.exe', fontfile + '.ttf'], stdout=subprocess.PIPE)
        else:
            subprocess.Popen([scriptPath + '/sfnt2woff', fontfile + '.ttf'], stdout=subprocess.PIPE)
    except OSError:
        # If the local version of sfnt2woff fails (i.e., on Linux), try to use the
        # global version. This allows us to avoid forcing OS X users to compile
        # sfnt2woff from source, simplifying install.
        subprocess.call(['sfnt2woff', fontfile + '.ttf'])

    # Convert TTF to WOFF2
    subprocess.call('woff2_compress \'' + fontfile + '.ttf\'', shell=True)

finally:
    pass
