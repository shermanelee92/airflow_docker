CREATE DATABASE airflow CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'airflow'@'localhost' IDENTIFIED BY 'airflow';
GRANT all privileges ON * . * to 'airflow'@'localhost';
CREATE USER 'airflow'@'airflow-slave1.my-bridge-network' IDENTIFIED BY 'airflow';
GRANT all privileges ON * . * to 'airflow'@'airflow-slave1.my-bridge-network';
flush privileges;
