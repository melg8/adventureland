#!/usr/bin/env sh

# SPDX-FileCopyrightText: © 2024 Melg Eight <public.melg8@gmail.com>
#
# SPDX-License-Identifier: MIT

set -e

python2.7 appserver/sdk/dev_appserver.py --storage_path=careful_server_storage/ --blobstore_path=careful_server_storage/blobstore/ --datastore_path=careful_server_storage/db.rdbms  --host=127.0.0.1 --admin_port=43291 --port=8083  adventureland/ --require_indexes --skip_sdk_update_check
