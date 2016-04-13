#! /bin/bash
if [[ $# > 0 ]]
then
    name="$1"
    if [ ! -e "namelist" ]; then
        touch "namelist"
    fi

    if grep -Fxq "$1" namelist;
    then
        echo "is already listed."
    elif [[ -n $(wget http://untappd.com/user/$name --spider 2>&1 | grep 404) ]]; then
        echo "Not a valid user"
    else
        echo $1 >> namelist
        echo "added."
    fi
fi
