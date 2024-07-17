FROM ghcr.io/gobiz-vinasat/image-php:8.3.0-octane

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    nodejs \
    npm \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sh", "-c", "composer install && npm install && php artisan octane:start --host 0.0.0.0 --port 80 --watch"]