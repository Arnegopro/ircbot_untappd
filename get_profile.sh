#! /bin/bash
while read p;   do
        `rm $p` 
        `wget untappd.com/user/$p`
       # if grep -Fxq "4 minutes ago\|3 minutes ago\|2 minutes ago\|a minute ago\|seconds ago" $p
       #     then
       #         echo 
       #     else
       # fi
done <namelist
