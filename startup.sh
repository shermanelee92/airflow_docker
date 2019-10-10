docker start airflow
docker exec airflow service mysql start
docker exec airflow airflow scheduler -D
docker exec airflow airflow webserver
