FROM nginx:latest
RUN ls /etc/nginx/conf.d/
RUN rm /etc/nginx/conf.d/default.conf
COPY port_80.html /usr/share/nginx/html/
COPY port_1337.html /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/
EXPOSE 1337
EXPOSE 80