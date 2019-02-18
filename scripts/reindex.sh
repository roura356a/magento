#!/bin/sh

GREEN='\033[1;32m'
NC='\033[m'

bin/magento indexer:reindex
chown -R www-data:www-data app/design/frontend var pub

printf "${GREEN}Index re-indexed.${NC}\n"
