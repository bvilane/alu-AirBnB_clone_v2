#!/usr/bin/env bash
<<<<<<< HEAD
# Sets up your web servers for the deployment of web_static
sudo apt-get -y update

# Install nginx
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'
# Create folders
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

# Create HMTL 
sudo touch /data/web_static/releases/test/index.html
echo "
<html>
 <head>
   <title>
   The title of your page
   </title>
 </head>
 
 <body>
   Your page content goes here.
 </body>
 </html>" > sudo /data/web_static/releases/test/index.html

# Symbolic link
sudo ln -sfn /data/web_static/releases/test/ /data/web_static/current

# Create ownership
sudo chown -R ubuntu:ubuntu /data/

# Setup nginx
sudo sed -i '/listen 80 default_server/a location /hbnb_static/ {alias /data/web_static/current/;}' /etc/nginx/sites-available/default

#Restart nginx
sudo service nginx restart
=======
# Install Nginx if not already installed
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install nginx

# create folders
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared
#create a fake html file
echo "This is a test" | sudo tee /data/web_static/releases/test/index.html
# create symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

# give ownership
sudo chown -hR ubuntu:ubuntu /data/
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx start
>>>>>>> 2ca41524e28f0bfa8bb00a60e6c5ef5b347fe8b6
