#!/usr/bin/env sh

# SPDX-FileCopyrightText: © 2024 Melg Eight <public.melg8@gmail.com>
#
# SPDX-License-Identifier: MIT

set -e

BACKUP_TIMESTAMP=$(date +"%Y_%m_%d_%H_%M_%S")

BACKUP_DIR="../auto_backups/careful_server_storage_$BACKUP_TIMESTAMP"

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

cp -r . "$BACKUP_DIR"
echo "Copy created in $BACKUP_DIR"

bash "$BACKUP_DIR/clean_databases.sh"

rm -rf "$BACKUP_DIR/.git"
echo ".git removed"

echo "Backup created in $BACKUP_DIR"