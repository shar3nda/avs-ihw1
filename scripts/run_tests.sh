#!/bin/bash
IND=1
FILE_COUNT=$(ls -1q tests/*.in | wc -l)
for filename in tests/*.in; do
    DIFF=$(diff -uw "${filename%.*}.out" <(cat $filename | ./main $(xargs)))
    if [ "$DIFF" != "" ]; then
        echo "-> Test $IND/$FILE_COUNT ERROR <-"
        echo "$DIFF"
    else
        echo "-> Test $IND/$FILE_COUNT OK <-"
    fi
    IND=$((IND+1))
    echo
done
