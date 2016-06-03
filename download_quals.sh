TFILE=`mktemp -t quals`

curl http://www.math.uga.edu/qualifying-exams/Topology | \
    grep -i pdf | \
    grep -iv campus | \
    sed -e 's/.*="\(.*\.pdf\)".*/\1/g' > $TFILE
echo $TFILE
cat $TFILE
wget -i $TFILE
rm $TFILE
