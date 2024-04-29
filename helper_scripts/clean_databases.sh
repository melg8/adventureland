#!/usr/bin/env sh

# SPDX-FileCopyrightText: © 2024 Melg Eight <public.melg8@gmail.com>
#
# SPDX-License-Identifier: MIT

set -e

BACKUP_DIR="./"

get_entity_count_in_table() {
    table_name=$1
    echo "$(sqlite3 "$BACKUP_DIR/db.rdbms" "SELECT COUNT(*) FROM '$table_name' WHERE kind = 'Event'")"
}

get_entity_count() {
    echo "$(get_entity_count_in_table 'dev~twodimensionalgame!!Entities')"
}

get_entity_by_property_cout() {
    echo "$(get_entity_count_in_table 'dev~twodimensionalgame!!EntitiesByProperty')"
}

rm -f "$BACKUP_DIR/logs.db"
echo "logs.db removed"

echo "Removing entities: $(get_entity_count)"
sqlite3 "$BACKUP_DIR/db.rdbms" "DELETE FROM 'dev~twodimensionalgame!!Entities' WHERE kind = 'Event'"
ENTITIES_COUNT=$(sqlite3 "$BACKUP_DIR/db.rdbms" "SELECT COUNT(*) FROM 'dev~twodimensionalgame!!Entities' WHERE kind = 'Event'")
echo "Entities count after removal: $(get_entity_count)"

echo "Removing entities by property: $(get_entity_by_property_cout)"
sqlite3 "$BACKUP_DIR/db.rdbms" "DELETE FROM 'dev~twodimensionalgame!!EntitiesByProperty' WHERE kind = 'Event'"
echo "Entities by property count after removal: $(get_entity_by_property_cout)"

sqlite3 "$BACKUP_DIR/db.rdbms"  'VACUUM;'

echo "db.rdbms vacuumed"
