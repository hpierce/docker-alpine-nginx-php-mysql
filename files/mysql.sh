#!/bin/bash
echo "Starting mysql ..."
mysql_install_db  --user=mysql >/dev/null 2>&1
/usr/bin/mysqld_safe --datadir="/var/lib/mysql" >/dev/null 2>&1 &
sleep 10
mysqladmin -u root password changeme >/dev/null 2>&1

echo "Loading database ..."
cd /var/www/test_db 
mysql -pchangeme < employees.sql >/dev/null

echo "Verifying database ..."
mysql -pchangeme -t < test_employees_md5.sql && \
mysql -pchangeme -t < test_employees_sha.sql 

