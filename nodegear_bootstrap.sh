#!/bin/bash

cd /srv/app
if [ $? -ne 0 ]; then
  echo '/srv/app does not exist'
  exit 3
fi

# Set root permissions
chown -R root:root .

npm install --unsafe-perm
if [ $? -ne 0 ]; then
  echo npm failed to install
  exit 2
fi

if [ ! -z "$NODEMON" ]
then
  npm install -g nodemon
  nodemon -i node_modules/ -x "npm start"
  
  return 0
fi

npm start 2>&1
if [ $? -ne 0 ]; then
  echo App Quit
  exit 1
fi

exit 0
