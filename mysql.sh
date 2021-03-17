#!/bin/bash

SERVER= 
USER=${vault kv get -tls-skip-verify -field=username secrets/azure/databases/$SERVER}

> ~/.my.cnf

echo "[client]
socket=/var/run/mysqld/mysqld.sock
host=$SERVER.mysql.database.azure.com
user=$USER@$SERVER
password=$(vault kv get -tls-skip-verify -field=password secrets/azure/databases/$SERVER)
" >> ~/.my.cnf

if mysql < ./quit.sql
  then
    export DATABASE="MySQL" 
    export STATUS="Active"
    python pushtolaw.py
  else
    export DATABASE="MySQL" 
    export STATUS="Error"
    python pushtolaw.py
fi
