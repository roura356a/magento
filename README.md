# Magento 2.x Dockerfile
[![](https://images.microbadger.com/badges/image/roura/magento.svg)](https://microbadger.com/images/roura/magento)
[![](https://images.microbadger.com/badges/version/roura/magento.svg)](https://microbadger.com/images/roura/magento)

[![Docker build](http://dockeri.co/image/roura/magento)](https://hub.docker.com/r/roura/magento/)

## Magento 2 installation made easy
After running any `Dockerfile` you will have an environment tailored for Magento 2.x:
- Debian Jessie
- PHP 7.x (depends on magento version)
- Apache 2.4
- Magento 2.x
- Mageplaza Blog
- Mageplaza Banner Slider
- Composer
- Node
- Grunt

## Requirements
Before running the container for the first time, you should prepare the following environment variables:
- `$MYSQL_HOST`
- `$MYSQL_USER`
- `$MYSQL_PASSWORD`
- `$MYSQL_DATABASE`

You'll need a database running on `MySQL 5.6+`, as this container only has the `web` service.

### How to run
- Add `magento.docker` at the end of your `/etc/hosts` file (i.e., `127.0.0.1 magento.docker`)
- Run `docker-compose build && docker-compose up -d`
- SSH into the container and run the installation as per how-to of Magento. (`/var/www/html/bin/magento setup:install`)
- Visit your newly-created [magento.docker](http://magento.docker/)
