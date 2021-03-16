#!/bin/bash

if PGPASSWORD=$(vault kv get -tls-skip-verify -field=password secrets/azure/databases/$SERVER) psql -h $SERVER.postgres.database.azure.com -d postgres \
-U $(vault kv get -tls-skip-verify -field=username secrets/azure/databases/$SERVER)"@"$SERVER < ./quit.dbu
then
  export SERVER=$SERVER
  export STATUS="Active"
  python pushtolaw.py
else
  export SERVER=$SERVER
  export STATUS="Error"
  python pushtolaw.py
fi
