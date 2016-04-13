#! /bin/bash
rm *.profile 
for p in $(cat namelist); do
        wget untappd.com/user/$p -O "$p.profile" 2>/dev/null
done
