# README

## important notice
The docker compose file to not capable with windows system. Guess is the .sh file problem.

Please run it on either Linux (recommand) or MacOS.

## How to run

### run with Docker (Recommanded)
Make sure that you have ```docker``` and ```docker-compose``` installed on your machine

Then run ```docker-compose build``` to build rails enviroment.

Then run ```docker-compose up -d``` to run the whole lab-4 dockers.

The docker file seperate db and rails. The docker is for culculate only. DB storage is in ```./tmp/db```, you can change them in ```docker-compose.yml```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
