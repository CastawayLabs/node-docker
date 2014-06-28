#!/bin/bash

cd /srv/app
npm install

npm start > /var/log/app.log 2>&1
