#!/bin/sh

cp main.html    ./app/
cp package.json ./app/
cd              ./app/
npm install --production
cd ./../
node_modules/.bin/nwbuild ./app/ -p win32,win64,osx64
