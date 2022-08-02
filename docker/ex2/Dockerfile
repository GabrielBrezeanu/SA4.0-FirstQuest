FROM nginx

RUN apt-get update && apt-get install -y nginx-extras

COPY ./nginx/default.conf /etc/nginx/nginx.conf
COPY ./web/ /usr/share/nginx/html