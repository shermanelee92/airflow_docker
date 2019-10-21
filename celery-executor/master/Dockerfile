FROM rastasheep/ubuntu-sshd

ENV AIRFLOW_HOME=/usr/local/airflow_home
RUN useradd -ms /bin/bash worker

RUN apt-get update \
&& apt-get install mysql-server -y \
&& apt-get install libmysqlclient-dev -y

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install libxml2-dev --yes
RUN apt-get install python3.6-dev --yes
RUN wget https://bootstrap.pypa.io/get-pip.py \
&& python3.6 get-pip.py \
&& pip3 install apache-airflow[mysql]\
&& pip3 install apache-airflow[celery]

COPY config/airflow.cfg /usr/local/airflow_home/
COPY config/my.cnf /etc/mysql/
COPY config/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

RUN mkdir /usr/local/airflow_home/dags

RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list \
&& wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add - \
&& apt-get install rabbitmq-server -y \
&& update-rc.d rabbitmq-server defaults

EXPOSE 3306
EXPOSE 5672

RUN chown -R worker:worker /usr/local

COPY setup_script.sql /usr/local

USER worker

CMD /bin/bash
