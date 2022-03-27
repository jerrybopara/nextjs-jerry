echo "Kill all the running PM2 actions"
pm2 kill

echo "Jump to app folder"
cd /home/ubuntu/next-js/

# echo "Update app from Git"
# git pull

echo "Install app dependencies"
rm -rf node_modules package-lock.json
yarn # Install dependencies

echo "Build your app"
yarn build # build our app for production

yarn global add pm2 # install pm2 to keep next app active forever

echo "Run new PM2 action"
pm2 start npm --name "nextapp" -- start # start next app
