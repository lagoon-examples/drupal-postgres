FROM uselagoon/php-8.0-cli-drupal:latest

COPY composer.* /app/
COPY assets /app/assets
RUN composer self-update --2 \
  && composer install --no-dev
COPY . /app
RUN mkdir -p -v -m775 /app/web/sites/default/files

# Override the default Drush extra-dump command for MariaDB
ENV EXTRA_DUMP_CMD=" "

# Define where the Drupal Root is located
ENV WEBROOT=web
