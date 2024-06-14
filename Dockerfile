# use this platform
FROM python:latest

# create or use this directory
WORKDIR /code

#copy the requirements.txt file in the code directory 
COPY requirements.txt /code/

# install the pip and all the things that in the requirements.txt with the pip cpmmand
RUN pip install -U pip
RUN pip install -r requirements.txt

# copy all the code in the root in the code directore 
COPY . /code/

# LEAVE THE PORT 8000 FREE FOR NGINX
EXPOSE 8000

# run this command
CMD ["gunicorn", "A.wsgi", ":8000"]

