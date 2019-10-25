#!/bin/bash

echo "Import public key used by package management system"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -

echo "Install gnupg"
sudo apt-get install gnupg

echo "Create list file for MongoDB"
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

echo "Updating..."
sudo apt-get update

echo "Install MongoDB"
sudo apt-get install -y mongodb-org

echo "Pinnig the current installed package"
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

echo "Starting MongoDB"
sudo service mongod start

echo "MongoDB status"
sudo service mongod status
