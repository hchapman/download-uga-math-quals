#!/bin/bash

# poppler_proxy.sh
# call poppler with destination as leading arg to work around gnu xargs

PDFNAME="$1"
shift

pdfunite "$@" $PDFNAME
