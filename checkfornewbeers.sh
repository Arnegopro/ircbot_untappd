#! /bin/bash
sh get_profile.sh
for i in $(cat namelist); do
    IFS=$'\n'
    beerslast5min=0
    for j in $(cat $i.profile | grep -Eo "([0-9]{2} [A-Za-z]{3} [0-9]{4} [0-9]{2}:[0-9]{2}:[0-9]{2})"); do

        # adjust timezone
        now=$(date +%s)
        if [[ $(date +%Z) -eq CEST ]]; then
            now=$(($now - 7200))
        elif [[ $(date +%Z) -eq CET ]]; then
            now=$(($now - 3600))
        else
            echo "dafuq"
        fi;

        beer=$(date --date=$j +%s)
        if [[ $(($now - $beer)) -le 300 ]]; then
            echo "new beerz for $i"
	    let "beerslast5min += 1"
	    echo "Beers = $beerslast5min"
	    echo "time = $j"
	    #Getting metadata from profile
	    checkinID=`( cat $i.profile | grep $j |grep -Eo "([0-9]{9})" )`
	    meta=`( cat $i.profile | grep -A 15 'id="checkin_'$checkinID )` 
            meta2=`( echo $meta | grep -oP '(?<=class="user">).*(?=/p)' )`	    
	    echo $meta2
	fi;
    done;
done;
