FROM debian:stretch-slim

RUN apt-get update && \
    apt-get install nginx
    apt-get install python3.6 python3-pip

RUN rm /etc/nginx/sites-enabled/default.conf
RUN mkdir -p /etc/uwsgi/sites/
COPY site.ini /etc/uwsgi/sites/
COPY default.conf /etc/nginx/sites-available/
COPY uwsgi.service /etc/systemd/system/
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/

RUN pip install uwsgi
RUN pip3 install -r requirements.txt

ADD ./site /var/www/site

EXPOSE 443
EXPOSE 80