#Getting the Python as a base Image
FROM python:3.9.20-slim


#setting up the Working Dir For rest of the process
#note the Docker file will create the directory if the mentioned dir does'nt exist in the filesystem
WORKDIR /usr/local/app/src

# installing the python-Django Framework

RUN set -eux;\
          apt-get update; \
          python3 -m venv myenv ; \
          . myenv/bin/activate ; \
          pip install django                


#copying the source code from the host to the image File System
#excluding the README.md file and Docker File
# it's also excluding the mentioned directory and copying only the child look into it
COPY ./myProject/  . 

EXPOSE 8000

# cannot be changed during the DOCKER RUN command in the docker client
#in EXEC form
ENTRYPOINT ["python3", "manage.py", "runserver"]
 #runs in the production Environment
 # can also override the ip Range and Port during the docker run in the Docker Client
CMD ["0.0.0.0:8000"]

