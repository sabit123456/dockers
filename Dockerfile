FROM ubuntu
MAINTAINER sabit.mubarik@fiveriverstech.com
RUN apt-get update && apt-get install nginx -y
CMD nginx -g 'daemon off;'
