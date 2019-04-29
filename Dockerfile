FROM roura/php-magento

ENV MAGENTO_ROOT "/var/www/html"

COPY ./auth.json /root/composer/

# Create Magento
RUN rm -rf $MAGENTO_ROOT
RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition="2.2.*" $MAGENTO_ROOT \
    && composer require mageplaza/magento-2-blog-extension mageplaza/magento-2-banner-slider-extension

# Setup Magento Cron Jobs
RUN wget https://github.com/chrismytton/shoreman/raw/master/shoreman.sh -O /usr/local/bin/shoreman \
    && touch /var/spool/cron/crontabs/root && crontab -l > newcron \
    && echo "* * * * * /var/www/html/cron.sh" >> newcron && crontab newcron && rm newcron

# Setup Frontend stuff
RUN mv package.json.sample package.json && npm install \
    && mv Gruntfile.js.sample Gruntfile.js && grunt

# Base Scripts
COPY ./scripts/* $MAGENTO_ROOT/

# Set Web Server Permissions
RUN chown -R www-data:www-data ./ && chmod +x /usr/local/bin/shoreman bin/magento cron.sh refresh.sh reindex.sh

CMD ["shoreman"]
