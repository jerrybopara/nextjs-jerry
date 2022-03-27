echo "Kill all the running PM2 actions"
pm2 kill

echo "Jump to app folder"
cd /home/ubuntu/next-js/

# echo "Update app from Git"
# git pull

echo "Install app dependencies"
rm -rf node_modules package-lock.json
npm install
# npm audit fix --force

echo "Build your app"
npm run build

echo "Run new PM2 action"
# sudo cp /home/ubuntu/ecosystem.json ecosystem.json
pm2 start ecosystem.json