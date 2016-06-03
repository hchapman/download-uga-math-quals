#!/bin/bash
# get_and_join.sh
# Download quals of a given subject and join into a pdf

PS3='Choose a Qual Subject: '
options=("Topology" "Probability" "Algebra"
         "Complex-Analysis" "Real-Analysis"
         "Analysis" "Numerical-Analysis")

select opt in "${options[@]}"
do
    bash download_quals.sh $opt
    bash join_quals.sh $opt
    break
done
