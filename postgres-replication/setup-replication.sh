#!/bin/bash

# If REPLICATE_FROM is empty, it means we are on 
# the master/primary node.
if [ "x$REPLICATE_FROM" == "x" ]; then

cat >> ${PGDATA}/postgresql.conf <<EOF
wal_level = hot_standby
max_wal_senders = $PG_MAX_WAL_SENDERS
wal_keep_segments = $PG_WAL_KEEP_SEGMENTS
hot_standby = on
EOF

# Else we are on the Slave/Replicate node.
else

cat > ${PGDATA}/recovery.conf <<EOF
standby_mode = on
primary_conninfo = 'host=${REPLICATE_FROM} port=5432 user=${POSTGRES_USER} password=${POSTGRES_PASSWORD}'
trigger_file = '/tmp/promote_to_master'
EOF
chown postgres ${PGDATA}/recovery.conf
chmod 600 ${PGDATA}/recovery.conf

fi
