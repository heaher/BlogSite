FROM python:3.8
ENV PYTHONUNBUFFERED 1
#ENV DOCKERIZE_VERSION v0.6.1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y apache2
RUN apt-get install -y apache2-dev
RUN pip install -r requirements.txt
RUN apt-get install git
#RUN apt-get update && apt-get install -y wget \
# && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
# && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
# && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
#RUN mod_wsgi-express install-module
RUN service apache2 start 
ADD wsgi.conf /etc/apache2/sites-available
COPY . /code/