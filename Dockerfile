FROM debian:bookworm

RUN apt-get update && apt-get install -y apache2

RUN rm /var/www/html/index.html

COPY ./public /var/www/html

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
