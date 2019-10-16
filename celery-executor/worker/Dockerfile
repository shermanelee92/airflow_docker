FROM rastasheep/ubuntu-sshd
RUN useradd -ms /bin/bash worker

# TODO: do the env for non root user
ENV AIRFLOW_HOME=/usr/local/airflow_home

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install libxml2-dev --yes
RUN apt-get install python3.6-dev --yes
RUN wget https://bootstrap.pypa.io/get-pip.py \
&& python3.6 get-pip.py \
&& pip3 install apache-airflow[celery]

RUN apt-get install libmysqlclient-dev -y \
&& pip3 install mysqlclient

COPY config/airflow.cfg /usr/local/airflow_home/

RUN mkdir /usr/local/airflow_home/dags \
&& chown -R worker:worker /usr/local/* 

RUN chmod 755 /usr/local/*

USER worker

CMD /bin/bash
