#!/bin/bash
set -e

echo "----------------------------------------------------------------"
echo " entrypoint.sh ${1%_safe}"
echo "----------------------------------------------------------------"
echo echo " entrypoint.sh ${1%_safe}" > /tmp/oo
if [ -z "$(ls -A /var/lib/mysql)" -a "${1%_safe}" = 'mysqld' ]; then
if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
echo >&2 'error: database is uninitialized and MYSQL_ROOT_PASSWORD not set'
echo >&2 '  Did you forget to add -e MYSQL_ROOT_PASSWORD=... ?'
exit 1
fi

mysql_install_db --user=mysql --datadir=/var/lib/mysql

# These statements _must_ be on individual lines, and _must_ end with
# semicolons (no line breaks or comments are permitted).
# TODO proper SQL escaping on ALL the things D:
TEMP_FILE='/tmp/mysql-first-time.sql'
cat > "$TEMP_FILE" <<-EOSQL
DELETE FROM mysql.user ;
CREATE USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;
GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;
DROP DATABASE IF EXISTS test ;
EOSQL

if [ "$MYSQL_DATABASE" ]; then
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" >> "$TEMP_FILE"
fi

if [ "$MYSQL_USER" -a "$MYSQL_PASSWORD" ]; then
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> "$TEMP_FILE"

if [ "$MYSQL_DATABASE" ]; then
echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> "$TEMP_FILE"
fi
fi

echo 'FLUSH PRIVILEGES ;' >> "$TEMP_FILE"

echo "before dims.sql"
cat /dims.sql >> "$TEMP_FILE"
echo "after dims.sql"

## ------------------------------------------------------------
## Fill the isd_calendar table
## ------------------------------------------------------------
start_date=$(date -d '2023-07-01' +%s)
end_date=$(date -d '2025-06-30' +%s)

current_date=$start_date

while [[ "$current_date" -le "$end_date" ]]; do
    day_desc=""
    day_type=0

    day_of_week=$(date -d "@$current_date" '+%u')

    if [ "$day_of_week" -le 5 ]; then
        day_desc="Working Day"
        day_type=0
    else
        day_desc="Weekend"
        day_type=2
    fi

    day=$(date -d "@$current_date" '+%Y-%m-%d')
    echo "INSERT INTO isd_calendar (calendar_date, date_description, day_type, holiday_description) VALUES ('$day', '$day_desc', '$day_type', '$day_desc');"  >> "$TEMP_FILE"

   current_date=$((current_date + 86400))
done

## ------------------------------------------------------------
## file the academic_year table
## ------------------------------------------------------------
current_year=$(date +'%Y')
for ((i = 0; i < 10; i++)); do
    start_year=$((current_year + i))
    end_year=$((start_year + 1))
    academic_year="${start_year}-${end_year}"
    sd="${start_year}-07-01 00:00:00"
    ed="${end_year}-06-30 23:59:59"
    echo "INSERT INTO academic_year (description, start_date, end_date) VALUES ('$academic_year', '$sd', '$ed');" >> "$TEMP_FILE"
done

set -- "$@" --init-file="$TEMP_FILE"
fi

chown -R mysql:mysql /var/lib/mysql
exec "$@"
