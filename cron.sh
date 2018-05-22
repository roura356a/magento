#!/usr/bin/env bash

/usr/local/bin/php $MAGENTO_ROOT/bin/magento cron:run | grep -v "Ran jobs by schedule" >> $MAGENTO_ROOT/var/log/magento.cron.log
/usr/local/bin/php $MAGENTO_ROOT/update/cron.php >> $MAGENTO_ROOT/var/log/update.cron.log
/usr/local/bin/php $MAGENTO_ROOT/bin/magento setup:cron:run >> $MAGENTO_ROOT/var/log/setup.cron.log

chown -R www-data:www-data app/design/frontend var pub
