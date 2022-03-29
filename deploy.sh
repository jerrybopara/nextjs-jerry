#!/bin/bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

REPODIR="nextjs-jerry"
APPNAME="nextjsapp"

echo "Kill all the running PM2 actions"
pm2 stop $APPNAME
pm2 delete $APPNAME
# pm2 kill

echo "Jump to app folder"
# cd /home/ubuntu/nextjs-jerry/
cd $HOME/$REPODIR/

echo "Update app from Git"
git pull

echo "Install app dependencies"
rm -rf node_modules package-lock.json
yarn # Install dependencies

echo "Build your app"
yarn build # build our app for production

# echo "Change Permissions."
# chown -R ubuntu:ubuntu /home/ubuntu/next-js

echo "Run new PM2 action"
pm2 start npm --name "$APPNAME" -- start # start next app 
