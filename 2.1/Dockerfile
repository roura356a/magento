FROM roura/php-magento:7.0

ENV MAGENTO_ROOT "/var/www/html"

COPY ./auth.json /root/composer/

# Create Magento
RUN rm -rf $MAGENTO_ROOT
RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition="2.1.*" $MAGENTO_ROOT
RUN composer require mageplaza/magento-2-blog-extension:2.4.6
RUN composer require mageplaza/magento-2-banner-slider-extension

# Setup Magento Cron Jobs
COPY ./cron.sh $MAGENTO_ROOT/
RUN touch /var/spool/cron/crontabs/root \
    && crontab -l > newcron \
    && echo "* * * * * $MAGENTO_ROOT/cron.sh" >> newcron \
    && crontab newcron && rm newcron

COPY ./scripts/* /var/www/html/
COPY ./etc/* /var/www/html/app/etc/

# Setup Frontend stuff
RUN mv package.json.sample package.json && npm install \
    && mv Gruntfile.js.sample Gruntfile.js && grunt

# Set Web Server Permissions
RUN cd $MAGENTO_ROOT && chown -R www-data:www-data ./
RUN chmod +x bin/magento
