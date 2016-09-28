FROM nginx:1.11-alpine
MAINTAINER Patrick Baber <patrick@p-squared.de>

# Copy project files
COPY etc/nginx /etc/nginx/conf.d
COPY src /usr/share/nginx/html

# Install curl
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

# Add check to verify container state
##HEALTHCHECK --interval=30s CMD curl --fail http://localhost/ || exit 1