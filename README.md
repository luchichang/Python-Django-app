# Python Django Applications
           A Simple Django Application

## Steps to run the application locally,

  * Installing the Runtime and setting up the local environment
       
        sudo apt update && sudo apt install python3 python3-django -y 
   
    _check whether Python3 and Django are downloaded and installed correctly _

        python3 --version

        django-admin --version
 
  * once Installed run  the succeding command, which will create the base structure to organize the project files and configuration of django application
  
        django-admin startproject **project_name**


  * once the application's base strucutre is created run the create app command to create the django application

         cd **project_name**
         django-admin manage.py startapp **app_name**  

  * run the application,

     for Development Environment

          python3 manage.py runserver

  
   the app will be visible in the local host loop back address ** 127.0.0.1:8000 **

   for Production Environment

         python3 manage.py runserver 0.0.0.0:8000  

anyone in the internet can access it


