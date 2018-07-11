FROM roura/php-magento:7.0

ENV MAGENTO_ROOT "/var/www/html"

COPY ./auth.json /root/composer/

# Create Magento
RUN rm -rf $MAGENTO_ROOT
RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition="2.2.*" $MAGENTO_ROOT
RUN composer require mageplaza/magento-2-blog-extension:2.4.6
RUN composer require mageplaza/magento-2-banner-slider-extension

# Setup Magento Cron Jobs
RUN touch /var/spool/cron/crontabs/root \
    && crontab -l > newcron \
    && echo "* * * * * /var/www/html/cron.sh" >> newcron \
    && crontab newcron && rm newcron

# Setup Frontend stuff
RUN mv package.json.sample package.json && npm install \
    && mv Gruntfile.js.sample Gruntfile.js && grunt

# Base Scripts
COPY ./scripts/* $MAGENTO_ROOT/
COPY ./etc/* $MAGENTO_ROOT/app/etc/

# Set Web Server Permissions
RUN cd $MAGENTO_ROOT && chown -R www-data:www-data ./
RUN chmod +x bin/magento cron.sh refresh.sh reindex.sh
