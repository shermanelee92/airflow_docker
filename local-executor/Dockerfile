FROM rastasheep/ubuntu-sshd

ENV AIRFLOW_HOME=/usr/local/airflow_home

RUN apt-get update \
&& apt-get install mysql-server -y \
&& apt-get install libmysqlclient-dev -y

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install libxml2-dev --yes
RUN apt-get install python3.6-dev --yes
RUN wget https://bootstrap.pypa.io/get-pip.py \
&& python3.6 get-pip.py \
&& pip3 install apache-airflow[mysql]

COPY config/airflow.cfg /usr/local/airflow_home/
COPY config/my.cnf /etc/mysql/

RUN mkdir /usr/local/airflow_home/dags
