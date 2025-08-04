#!/bin/bash
# /etc/keepalived/chk_postgresql.sh
# Check if PostgreSQL 12 service is active

# Check if PostgreSQL 12 is running
PG_STATUS=$(systemctl is-active postgresql-12.service)

# Debugging: Print the status to the log
echo "PostgreSQL status: $PG_STATUS"

# Check if service is active
if [ "$PG_STATUS" == "active" ]; then
    echo "PostgreSQL is active."
    exit 0  # PostgreSQL is running, return success (0)
else
    echo "PostgreSQL is not active."
    exit 1  # PostgreSQL is not running, return failure (1)
fi

