/usr/local/bin/php /var/www/public/cron/cron_feed.php # Fetch kills from other killboards (replaces cron_fetcher and cron_idfeed)
/usr/local/bin/php /var/www/public/cron/cron_zkb.php # Fetch kills from zKillboard APIs
/usr/local/bin/php /var/www/public/cron/cron_esi.php # Fetch kills from ESI

# Daily
# Remove old files from the cache.
/usr/local/bin/php /var/www/public/cron/cron_clearup.php
#Updated the values of items.
/usr/local/bin/php /var/www/public/cron/cron_value.php

# cache
/usr/local/bin/php /var/www/public/cron/cron_cache.php
