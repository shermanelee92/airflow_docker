dags_folder=$(pwd)/dags
echo $dags_folder
docker run -itd -v $dags_folder:/usr/local/airflow_home/dags -p 8080:8080 -p 15672:15672 -p 5555:5555 -p 3306:3306 --network=my-bridge-network --name=airflow-master airflow-master
docker run -itd -v $dags_folder:/usr/local/airflow_home/dags --network=my-bridge-network --name=airflow-slave1 airflow-slave
# ./set-up-ssh.sh
./master/set-up-airflow.sh
