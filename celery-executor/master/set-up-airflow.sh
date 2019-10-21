
docker exec -it airflow-master bash -c "su root -c 'chown -R mysql:mysql /var/lib/mysql'"

docker exec -it airflow-master bash -c "su root -c 'service mysql start'"

docker exec -it airflow-master bash -c "su root -c 'mysql -uroot -proot -e \"source /usr/local/setup_script.sql\"'"
docker exec -it airflow-master bash -c "su root -c 'rm -f /usr/local/setup_script.sql'"

docker exec -it airflow-master bash -c "su root -c 'service rabbitmq-server start'"
docker exec -it airflow-master bash -c "su root -c 'rabbitmq-plugins enable rabbitmq_management'"
docker exec -it airflow-master bash -c "su root -c 'rabbitmqctl add_user test test'"
docker exec -it airflow-master bash -c "su root -c 'rabbitmqctl set_user_tags test administrator'"
docker exec -it airflow-master bash -c "su root -c 'rabbitmqctl set_permissions -p / test \".*\" \".*\" \".*\"'"

docker exec -d airflow-master bash -c "cd /usr/local/airflow_home && airflow initdb && airflow scheduler -D && airflow webserver -D && airflow flower -D"
docker exec -d airflow-slave1 bash -c "airflow worker"
