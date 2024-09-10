#Getting the Python as a base Image
FROM python:3.9.20-slim


#setting up the Working Dir For rest of the process
#note the Docker file will create the directory if the mentioned dir does'nt exist in the filesystem
WORKDIR /usr/local/app

# installing the python-Django Framework

RUN set -eux;\
        sudo apt install python3-django -y                


#copying the source code from the host to the image File System
#excluding the README.md file and Docker File
COPY ./myProject  ./src/ 

EXPOSE 8000

# cannot be changed during the DOCKER RUN command in the docker client
#in EXEC form
ENTRYPOINT ["python3", "./src/myProject/manage.py", "runserver"]
 #runs in the production Environment
 # can also override the ip Range and Port during the docker run in the Docker Client
CMD ["0.0.0.0:8000"]

