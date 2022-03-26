echo "Deploying changes..."
cd /home/ubuntu/next-js
npm install 
npm run build 
pm2 delete 0
pm2 --name next-realworld-example-app start npm -- start