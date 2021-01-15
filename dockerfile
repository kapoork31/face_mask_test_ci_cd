# set base image (host OS)
FROM python:3.8

# Installing dependencies
COPY ./requirements.txt ./requirements.txt

RUN apt-get update -y
RUN apt install libgl1-mesa-glx -y
RUN apt-get install 'ffmpeg'\
    'libsm6'\
    'libxext6'  -y
RUN pip3 install --upgrade pip

RUN pip3 install opencv-python==4.3.0.38

RUN pip3 install -r /requirements.txt

# Copying the source code to 
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Creating and logging a user
# RUN adduser user
# USER user

# Commands for Docker run
EXPOSE 8000
CMD ["python", "main.py"]