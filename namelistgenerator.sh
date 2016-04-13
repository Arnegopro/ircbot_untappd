#! /bin/bash
if [[ $# > 0 ]]
then
    name="$1"
    if [ -e "namelist" ]
    then
        echo $name
    else
        echo >> "namelist"
    fi

    if [ -e "blockedlist" ]
    then
        echo " "
    else
        echo "get_profile.sh" >> blockedlist
        echo "namelist" >> blockedlist
        echo "namelistgenerator.sh" >> blockedlist
    fi

    if grep -Fxq "$1" namelist blockedlist
    then
        echo "is already listed."
    else
        echo $1 >> namelist
        echo "added."
    fi
fi
