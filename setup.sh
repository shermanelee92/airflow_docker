dags_folder=$(pwd)/dags
echo $dags_folder
docker run -itd -v $dags_folder:/usr/local/airflow_home/dags -p 8080:8080 --network=my-bridge-network --name=airflow airflow-with-mysql
./set-up-ssh.sh
./set-up-airflow.sh
