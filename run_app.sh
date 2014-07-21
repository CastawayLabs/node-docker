#!/bin/bash

cd /srv/app
if [ $? -ne 0 ]; then
  echo '/srv/app does not exist'
  exit 3
fi

npm install
if [ $? -ne 0 ]; then
  echo npm failed to install
  exit 2
fi

npm start 2>&1
if [ $? -ne 0 ]; then
  echo App Quit
  exit 1
fi

exit 0
