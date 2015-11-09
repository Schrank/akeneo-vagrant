#!/usr/bin/env bash

composer config -g github-oauth.github.com `cat /var/www/githubAuthToken`

rm -rf /var/www/html
cd /var/www
git clone https://github.com/akeneo/pim-community-dev.git html

cd /var/www/html
composer install -n

chmod -R 777 /var/www/html/app/cache /var/www/html/app/logs /var/www/html/web/bundles

/usr/bin/php /var/www/html/app/console pim:install --env=dev
/usr/bin/php /var/www/html/app/console cache:clear --env=dev
