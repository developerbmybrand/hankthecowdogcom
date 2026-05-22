#!/bin/sh
# heroku pgbackups:capture --expire --remote production --app hankthecowdogcom
heroku pg:backups capture -a hankthecowdogcom
wget -O latest.dump `heroku pg:backups public-url -a hankthecowdogcom | cat`
rake db:drop
rake db:create
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d hankthecowdog latest.dump
rm latest.dump
rake db:schema:dump
