#!/bin/bash

# download_quals.sh
# Download quals from UGA's math department website all at once
# Requires wget, which might not be installed on OS X (use brew!)

TFILE=`mktemp`
SUBJ=${1:-Topology}

curl http://www.math.uga.edu/qualifying-exams/$SUBJ | \
    grep -i pdf | \
    grep -iv campus | \
    grep -iv jQuery | \
    sed -e 's/.*="\(.*\.pdf\)".*\(Fall\).*>\([12][190][0-9][0-9]\)<.*/\1 \3_2.pdf/g' \
        -e 's/.*="\(.*\.pdf\)".*\(Spring\).*>\([12][190][0-9][0-9]\)<.*/\1 \3_1.pdf/g' \
        > $TFILE
#    sed -e 's/.*="\(.*\.pdf\)".*/\1/g' > $TFILE
echo $TFILE
cat $TFILE
mkdir $SUBJ
pushd $SUBJ
while IFS=" " read -r url fileName; do
    echo $fileName
    wget -O "$fileName" "$url"
done < $TFILE
#wget -i $TFILE
popd
rm $TFILE
