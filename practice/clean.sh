#!/data/data/com.termux/files/usr/bin/bash

# clean test_empty

for dir in $(ls)
do
    if [ -f $dir ] && [ $dir = test_empty ]
    then 
        echo "I will delete $dir."
        rm $dir
    fi
    if [ -d $dir ]
    then
        cd $dir
        for path in $(ls)
        do 
            if [ -f $path ] && [ $path = test_empty ]
            then
                echo "I will delete $path in $dir."
                rm $path
            fi
        done
        cd ..
    fi
done
