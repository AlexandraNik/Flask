#!/usr/bin/env bash 

##########################################
# author: purple-thistle
# goal: to deploy the flask app 
# deployment.sh should be in the same directory as routes.py
# 
##########################################

#install pip
apt update
apt install python-pip

#install postgres
apt install postgresql

    
#create database and table
createdb -h localhost -U postgres learningflask

psql -h localhost -U postgres learningflask -c "CREATE TABLE users (uid serial PRIMARY KEY,
        firstname VARCHAR(100) not null,
        lastname VARCHAR(1000) not null,
        email VARCHAR(120) not null unique,
        pwdhash VARCHAR(100) not null);"


#install virtual environment    
pip install virtualenv


#create and connect to virtual environment
virtualenv venv
source venv/bin/activate


#install requirements
pip install -r requirements.txt


python routes.py