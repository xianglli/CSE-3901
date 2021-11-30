# README

## important notice
This project can be run on operating systems with ```docker``` and ```docker-compose``` installed. But we did not fully test the project on Windows, so some of unexpected error maybe produced due to the file system privillage. If your system do not support ```docker``` (e.g, WSL 1 or OpenVZ VPS), you can use bare install instead. We do not fully test on bare machine install.

## How to run

## How to deploy

## Deploy with Docker (Recommanded)
For windows and macOS users, you can use ```docker desktop``` to run this project. However, if you are using ```docker desktop``` with ```WSL2``` backend, you may face performance issue since we will share local dictory into docker.

If you are using an linux machine (exclude WSL), Make sure that you have ```docker``` and ```docker-compose``` installed on your machine.

Run ```docker-compose build``` to build rails enviroment.

Run ```docker-compose up -d``` to run the whole lab-4 dockers.

Once the containers run properly, you can run ```docker-compose run yarn```, after that, run ```docker-compose run rails db:create```,```docker-compose run rails db:migrate```,```docker-compose run rails db:seed```.

The docker file seperate db and rails. The docker is for culculate only. DB storage is in docker volumn, you can change them in ```docker-compose.yml```.

## Deploy on bare machine
If you are running this project on a machine without docker or you would like to install docker, you can run that on bare machine.

Make sure that your have ruby and postgres installed on your enviroment. Our supported ruby verison is ```3.0.2```, that can be checked with command ```ruby -v```.

Then clone this project into your local file system, run ```bundle install```, ```yarn```,```rails db:create```, ```rails db:migrate```, ```rails db:seed```.

---

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
