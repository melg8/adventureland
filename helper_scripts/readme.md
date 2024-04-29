


## docker build
docker image build  ./docker_server --tag "cit_server"      

### docker run
docker container run --rm -it --network="host" --ulimit nofile=2048 -v "$(pwd):/home/user/work"  cit_server                       

## Server start
python2.7 appserver/sdk/dev_appserver.py --storage_path=appserver/storage/ --blobstore_path=appserver/storage/blobstore/ --datastore_path=appserver/storage/db.rdbms  --host=127.0.0.1 --admin_port=43291 --port=8083  adventureland/ --require_indexes --skip_sdk_update_check

python2.7 appserver/sdk/dev_appserver.py --storage_path=careful_server_storage/ --blobstore_path=careful_server_storage/blobstore/ --datastore_path=careful_server_storage/db.rdbms  --host=127.0.0.1 --admin_port=43291 --port=8083  adventureland/ --require_indexes --skip_sdk_update_check


cd adventureland/node

node server.js EU I 8022


## Single Command

### Python server
docker container run --rm -it --network="host" --ulimit nofile=2048 -v "$(pwd):/home/user/work" --entrypoint "python2.7" cit_server appserver/sdk/dev_appserver.py --storage_path=appserver/storage/ --blobstore_path=appserver/storage/blobstore/ --datastore_path=appserver/storage/db.rdbms --host=127.0.0.1 --admin_port=43291 --port=8083 adventureland/ --require_indexes --skip_sdk_update_check

## New scripts
./start_docker_login_server.sh 
then
./start_docker_eu_1_server.sh

## For backup
./careful_server_storage/backup_db.sh

## For backup restoration
./git_backup/deploy_db.sh

### Tree
.
├── adventureland
│   ├── admin.py
│   ├── admin.pyc
│   ├── api.py
│   ├── api.pyc
│   ├── app.yaml
│   ├── config.py
│   ├── config.pyc
│   ├── crons.py
│   ├── crons.pyc
│   ├── cron.yaml
│   ├── css
│   ├── design
│   ├── docs
│   ├── electron
│   ├── functions.py
│   ├── functions.pyc
│   ├── helper_scripts
│   ├── htmls
│   ├── images
│   ├── index.yaml
│   ├── js
│   ├── lib
│   ├── libraries
│   ├── LICENSE
│   ├── main.py
│   ├── main.pyc
│   ├── models.py
│   ├── models.pyc
│   ├── node
│   ├── origin
│   ├── python3
│   ├── queue.yaml
│   ├── README.md
│   ├── requirements.txt
│   ├── scripts
│   ├── secrets.py
│   ├── secrets.pyc
│   ├── solo_self_found_challenge.md
│   ├── sounds
│   ├── tasks.py
│   ├── tasks.pyc
│   ├── tests.py
│   ├── tests.pyc
│   ├── TODO.txt
│   ├── uploaders.py
│   ├── useful
│   ├── utility
│   └── WEEK.txt
├── appserver
│   ├── README.md
│   ├── sdk
│   └── storage
├── careful_server_storage
│   ├── backup_db.sh
│   ├── blobstore
│   ├── db.rdbms
│   ├── logs.db
│   ├── logs.db-journal
│   ├── search_indexes
│   └── xsrf
├── git_backup
│   ├── db.rdbms
│   └── deploy_db.sh
├── start_docker_eu_1_server.sh
├── start_docker_login_server.sh
├── start_eu_1_server.sh
└── start_login_server.sh

