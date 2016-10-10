#!/bin/bash
/usr/bin/mysqld_safe --datadir="/var/lib/mysql" >/dev/null &
php-fpm7 &
nginx &
/bin/bash
