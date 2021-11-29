# README

## important notice
This project can be run on operating systems with ```docker``` and ```docker-compose``` installed. But we did not fully test the project on Windows, so some of unexpected error maybe produced due to the file system privillage. If your system do not support ```docker``` (e.g, WSL 1 or OpenVZ VPS), you can use bare install instead. We do not fully test on bare machine install.

## How to run

### run with Docker (Recommanded)
Make sure that you have ```docker``` and ```docker-compose``` installed on your machine

Then run ```docker-compose build``` to build rails enviroment.

Then run ```docker-compose up -d``` to run the whole lab-4 dockers.

The docker file seperate db and rails. The docker is for culculate only. DB storage is in docker volumn, you can change them in ```docker-compose.yml```

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
