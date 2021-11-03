# Project 3 by Future Tech Corp

This project is a OSU CSE course information and Login system. This project is based on Ruby on Rails.

* System dependencies 
  * we have test this project on Ubuntu with ruby verison ```2.7.4``` and rails version ```6.1.4.1```, not sure about lower version
  but hopefully works well. We use postgresql version ```13```, and tested it on postgresql version ```12```.

* Configuration
  * Before run this project, please make sure that postgres has started by ```pg_ctlcluster <version> <cluster> start```
  * Please make sure the postgres library has been installed by ```sudo apt install libpq-dev```
  * Use ```bundle install```to install missing gems
  * Run ```yarn```to install node modules

* Database creation
  * run ```rails db:create```to create databases
  * run ```rails db:migrate``` to migrate table structure
  
* Deployment instructions
  * The first registered user would become admin and only admin have the right to sync courses with OSU website
  * All the user information, including name, identity and photos are taken from OSU by filling OSU id (dot id) in the registration. 
  * Courses are sync with OSU website by the API ```https://content.osu.edu/v2/classes/search``` and personal profile information from ```http://directory.osu.edu/fpjson.php```
  
### Acknowledgement
The design of the page theme are from ```https://html5up.net```

Thanks for the Gem ```ransack``` to do search & sort and ```devise``` for user identity job.



