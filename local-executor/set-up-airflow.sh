# Q1="CREATE DATABASE airflow CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
# Q2="create user 'airflow'@'localhost' identified by 'airflow';"
# Q3="grant all privileges on * . * to 'airflow'@'localhost';"
# Q4="flush privileges;"
# SQL="${Q1}${Q2}${Q3}${Q4}"
#
# docker exec airflow chown -R mysql:mysql /var/lib/mysql
# docker exec airflow service mysql start
# docker exec airflow mysql -uroot -proot -e "$SQL"

# docker exec airflow bash -c "cd /usr/local/airflow_home && airflow initdb && airflow scheduler -D && airflow webserver"
