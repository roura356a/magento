#!/usr/bin/env bash

/usr/local/bin/php /var/www/html/bin/magento cron:run | grep -v "Ran jobs by schedule" >> /var/www/html/var/log/magento.cron.log
/usr/local/bin/php /var/www/html/update/cron.php >> /var/www/html/var/log/update.cron.log
/usr/local/bin/php /var/www/html/bin/magento setup:cron:run >> /var/www/html/var/log/setup.cron.log

chown -R www-data:www-data app/design/frontend var pub
