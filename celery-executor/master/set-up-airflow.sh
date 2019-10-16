Q1="CREATE DATABASE airflow CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
Q2="create user 'airflow'@'localhost' identified by 'airflow';"
Q3="grant all privileges on * . * to 'airflow'@'localhost';"
Q4="create user 'airflow'@'airflow-slave1.my-bridge-network' identified by 'airflow';"
Q5="grant all privileges on * . * to 'airflow'@'airflow-slave1.my-bridge-network';"
Q6="flush privileges;"
SQL="${Q1}${Q2}${Q3}${Q4}${Q5}${Q6}"

docker exec airflow-master chown -R mysql:mysql /var/lib/mysql
docker exec airflow-master service mysql start
docker exec airflow-master mysql -uroot -proot -e "$SQL"

docker exec airflow-master service rabbitmq-server start
docker exec airflow-master rabbitmq-plugins enable rabbitmq_management
docker exec airflow-master rabbitmqctl add_user test test
docker exec airflow-master rabbitmqctl set_user_tags test administrator
docker exec airflow-master rabbitmqctl set_permissions -p / test ".*" ".*" ".*"


docker exec -d airflow-master bash -c "cd /usr/local/airflow_home && airflow initdb && airflow scheduler -D && airflow webserver -D && airflow flower -D"
docker exec -d airflow-slave1 bash -c "airflow worker"
