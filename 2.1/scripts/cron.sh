#!/usr/bin/env bash

echo "Running Magento Cron"

echo "bin/magento cron:run"
/usr/local/bin/php /var/www/html/bin/magento cron:run | grep -v "Ran jobs by schedule" >> /var/www/html/var/log/magento.cron.log

echo "update/cron.php"
/usr/local/bin/php /var/www/html/update/cron.php >> /var/www/html/var/log/update.cron.log

echo "bin/magento setup:cron:run"
/usr/local/bin/php /var/www/html/bin/magento setup:cron:run >> /var/www/html/var/log/setup.cron.log

echo "Setting permissions..."
chown -R www-data:www-data /var/www/html/app/design/frontend /var/www/html/var /var/www/html/pub

echo "Ran Magento cron job"
