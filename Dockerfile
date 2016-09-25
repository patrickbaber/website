FROM nginx:1.11-alpine
MAINTAINER Patrick Baber <patrick@p-squared.de>
COPY etc/nginx /etc/nginx/conf.d
COPY src /usr/share/nginx/html