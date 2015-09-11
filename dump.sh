#!/bin/bash

set -e

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/dump/$PREFIX-$DATE.sql"

pg_dump -h db -U "$PGUSER" -f "$FILE"
gzip "$FILE"
