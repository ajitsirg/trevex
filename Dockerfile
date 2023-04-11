# base image  
FROM python:3.8.10  
# setup environment variable  
ENV DockerHOME=/home/app/webapp  

# set work directory  
RUN mkdir -p . $travex

# where your code lives  
WORKDIR $travex 

# set environment variables  
# ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# install dependencies  
RUN pip install --upgrade pip  

# copy whole project to your docker home directory. 
COPY . $travex  
# run this command to install all dependencies  
RUN pip install -r requirements.txt  
# port where the Django app runs  
EXPOSE 8000  
# start server  
CMD ["python3", "manage.py", "runserver"]