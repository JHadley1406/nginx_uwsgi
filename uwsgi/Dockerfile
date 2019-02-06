FROM debian:stretch-slim

RUN apt-get -yq update && \
    apt-get -yq install build-essential && \
    apt-get -yq install python-dev && \
    apt-get -yq install python3-dev && \
    apt-get -yq install python3-pip

RUN mkdir -p /etc/uwsgi/sites/
COPY site.ini /etc/uwsgi/sites/
#COPY default.conf /etc/nginx/sites-available/
#COPY uwsgi.service /etc/systemd/system/ 
COPY requirements.txt .
#RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/

RUN pip3 install uwsgi
RUN pip3 install -r requirements.txt

ADD ./helloworld /var/www/helloworld
EXPOSE 8080
CMD ["uwsgi", "--ini", "/etc/uwsgi/sites/site.ini"]