#!/usr/bin/env sh

# SPDX-FileCopyrightText: © 2024 Melg Eight <public.melg8@gmail.com>
#
# SPDX-License-Identifier: MIT

set -e

docker container run --rm -it --network="host" --ulimit nofile=2048 -v "$(pwd):/home/user/work" --entrypoint "./start_login_server.sh" cit_server 


