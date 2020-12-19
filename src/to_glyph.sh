#!/bin/bash
printf "$(printf '\\U%08x' $1)\n"
