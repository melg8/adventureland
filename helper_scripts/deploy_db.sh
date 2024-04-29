#!/usr/bin/env sh

# SPDX-FileCopyrightText: © 2022 Melg Eight <public.melg8@gmail.com>
#
# SPDX-License-Identifier: MIT

# Should be in git_backup directory to work properly.

set -e

echo "Deploying to careful_server_storage"
mkdir -p ../careful_server_storage
cp -r ../appserver/storage/* ../careful_server_storage/
cp ../adventureland/helper_scripts/backup_db.sh ../careful_server_storage/backup_db.sh

echo "Removing old db.rdbms and logs.db"
rm -f ../careful_server_storage/db.rdbms
rm -f ../careful_server_storage/logs.db

echo "Copying db.rdbms and logs.db"
cp ./db.rdbms ../careful_server_storage/db.rdbms

echo "Done"