TFILE=`mktemp`

curl http://www.math.uga.edu/graduate/oldqualifyingexams.htm | \
    grep -i topology | \
    grep -i pdf | \
    sed -e 's/.*="\(.*\.pdf\)".*/http:\/\/www.math.uga.edu\/graduate\/\1/g' > $TFILE
echo $TFILE
wget -i $TFILE
rm $TFILE
