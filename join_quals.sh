#!/bin/bash

# join_quals.sh
# Join a bunch of UGA Math qualifying exams into one pdf
# Requires: poppler (for pdfunite)

SUBJ=Topology

find $SUBJ -name \*\.pdf | sort -r -t _ | xargs -J {} pdfunite {} "$SUBJ"_thru_`date "+%m_%Y"`.pdf
