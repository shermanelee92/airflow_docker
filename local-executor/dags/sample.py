from airflow.operators import PythonOperator
from airflow.models import DAG
from datetime import datetime, timedelta
args = {'owner':'airflow', 'start_date' : datetime(2018, 10, 1), 'retries': 2, 'retry_delay': timedelta(minutes=1) }
dags = DAG('test_dag', default_args = args)
def print_context(val):
    print(val)
def print_text():
    print('Hello-World')
t1 = PythonOperator(task_id='multitask1',op_kwargs={'val':{'a':1, 'b':2}}, python_callable=print_context, dag = dags)
t2 = PythonOperator(task_id='multitask2', python_callable=print_text, dag=dags)
t2.set_upstream(t1)
