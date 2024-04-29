#!/usr/bin/env sh

# SPDX-License-Identifier: MIT

# Function to get the creation date and time of the db.rdbms file
get_db_creation_date() {
    echo "$(stat -c %y db.rdbms)"
}

# Retrieve the creation date and time of the db.rdbms file
DB_CREATION_DATETIME=$(get_db_creation_date)

while :
do
    echo "Creating backup..."
    rm -f ./db.rdbms.backup
    sqlite3 ./db.rdbms ".backup 'db.rdbms.backup'"
    
    if [ $? -eq 0 ]; then
        echo "Backup successful"
        break
    elif [ $? -eq 1 ]; then
        echo "Database is locked, retrying in 5 seconds..."
        sleep 5
    else
        echo "Backup failed with an unexpected error"
        break
    fi
done

BACKUP_DIR="./"
DB_BACKUP_FILE="db.rdbms.backup"

get_entity_count_in_table() {
    table_name=$1
    echo "$(sqlite3 "$BACKUP_DIR/$DB_BACKUP_FILE" "SELECT COUNT(*) FROM '$table_name' WHERE kind = 'Event'")"
}

get_entity_count() {
    echo "$(get_entity_count_in_table 'dev~twodimensionalgame!!Entities')"
}

get_entity_by_property_count() {
    echo "$(get_entity_count_in_table 'dev~twodimensionalgame!!EntitiesByProperty')"
}

echo "Removing entities: $(get_entity_count)"
sqlite3 "$BACKUP_DIR/$DB_BACKUP_FILE" "DELETE FROM 'dev~twodimensionalgame!!Entities' WHERE kind = 'Event'"
ENTITIES_COUNT=$(sqlite3 "$BACKUP_DIR/$DB_BACKUP_FILE" "SELECT COUNT(*) FROM 'dev~twodimensionalgame!!Entities' WHERE kind = 'Event'")
echo "Entities count after removal: $(get_entity_count)"

echo "Removing entities by property: $(get_entity_by_property_count)"
sqlite3 "$BACKUP_DIR/$DB_BACKUP_FILE" "DELETE FROM 'dev~twodimensionalgame!!EntitiesByProperty' WHERE kind = 'Event'"
echo "Entities by property count after removal: $(get_entity_by_property_count)"

sqlite3 "$BACKUP_DIR/$DB_BACKUP_FILE" 'VACUUM;'

echo "$DB_BACKUP_FILE vacuumed"

echo "Moving db to git repository..."
mv ./db.rdbms.backup ../git_backup/db.rdbms

cd ../git_backup
git add .

# Backup with creation date and time as commit message
set GIT_COMMITTER_DATETIME="$DB_CREATION_DATETIME"
set GIT_AUTHOR_DATETIME="$DB_CREATION_DATETIME"
git commit --date="$DB_CREATION_DATETIME" -S -m "Backup db.rdbms on $DB_CREATION_DATETIME"
git push
