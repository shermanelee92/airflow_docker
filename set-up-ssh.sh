#!/bin/sh
echo "creating ssh key for airflow"
docker exec -it airflow ssh-keygen -t rsa -b 4096
echo "moving ssh key for airflow"
docker exec airflow bash -c 'cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys'
echo "change owner for airflow"
docker exec airflow bash -c 'chmod og-wx ~/.ssh/authorized_keys'
docker exec airflow bash -c 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no localhost'

docker exec -it airflow bash -c 'ssh-copy-id -i ~/.ssh/id_rsa.pub root@hadoop-master'
