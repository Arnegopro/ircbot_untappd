for i in $(cat namelist); do
    IFS=$'\n'
    for j in $(cat $i | grep -Eo "([0-9]{2} [A-Za-z]{3} [0-9]{4} [0-9]{2}:[0-9]{2}:[0-9]{2})"); do

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
        fi;
    done;
done;
