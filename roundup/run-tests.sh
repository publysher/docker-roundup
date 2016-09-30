#!/usr/bin/env sh
set -e
set -u

wait_for() {
    echo -n "Waiting for $1:$2 "
    while ! nc -z $1 $2
    do
        echo -n "."
        sleep 0.25
    done
    echo "[OK]"
}

if [ -f /tests/links.txt ]
then
    while IFS=: read host port
    do
        wait_for ${host} ${port}
    done < /tests/links.txt
fi

exec /usr/local/bin/roundup
