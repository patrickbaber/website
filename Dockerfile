FROM nginx:1.13-alpine
LABEL maintainer "mail@patrickbaber.de"

# Install curl
RUN apk add --update \
    curl \
    && \
    rm -rf /var/cache/apk/*

# Copy project files
COPY etc/nginx /etc/nginx/conf.d
COPY src /var/www

# Set working directory for interacting with container
WORKDIR /var/www

# Build arguments
ARG COMMIT=no-commit-set
ARG BUILD=no-build-set

# Set Meta Informations
RUN sed -i "s/build-empty/$BUILD/g" index.html && \
    sed -i "s/commit-empty/$COMMIT/g" index.html

# Add check to verify container state
##HEALTHCHECK --interval=30s CMD curl --fail http://localhost/ || exit 1