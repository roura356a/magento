#!/bin/sh

GREEN='\033[1;32m'
NC='\033[m'

bin/magento indexer:reindex
bin/magento cache:enable
bin/magento cache:flush

chown -R www-data:www-data app/design/frontend var pub

printf "${GREEN}Application updated to a deployed status.${NC}\n"
