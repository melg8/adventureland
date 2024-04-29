#!/usr/bin/env sh

# SPDX-FileCopyrightText: © 2024 Melg Eight <public.melg8@gmail.com>
#
# SPDX-License-Identifier: MIT

set -e

docker container run --rm -it --network="host" --ulimit nofile=2048 -v "$(pwd):/home/user/work" --entrypoint "python2.7" cit_server appserver/sdk/dev_appserver.py --storage_path=appserver/storage/ --blobstore_path=appserver/storage/blobstore/ --datastore_path=appserver/storage/db.rdbms --host=127.0.0.1 --admin_port=43291 --port=8083 adventureland/ --require_indexes --skip_sdk_update_check


