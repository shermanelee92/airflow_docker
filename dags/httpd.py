import json
from datetime import timedelta

import airflow
from airflow import DAG
from airflow.operators.http_operator import SimpleHttpOperator
from airflow.operators.bash_operator import BashOperator
from airflow.sensors.http_sensor import HttpSensor

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': airflow.utils.dates.days_ago(2),
    'email': ['airflow@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG('example_http_operator2', default_args=default_args)

dag.doc_md = __doc__

t1 = BashOperator(
    task_id='also_run_this',
    bash_command='wget hadoop-master:8088',
    dag=dag,
)

t1
