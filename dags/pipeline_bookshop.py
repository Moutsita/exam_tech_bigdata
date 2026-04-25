from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.trigger_dagrun import TriggerDagRunOperator
from datetime import datetime

with DAG(
    dag_id="pipeline_bookshop",
    start_date=datetime(2026, 4, 1),
    schedule_interval=None, # On le met en manuel pour tes tests
    catchup=False
) as dag:

    # Utilisation de l'opérateur officiel pour déclencher un autre DAG
    ingestion = TriggerDagRunOperator(
        task_id="run_ingestion",
        trigger_dag_id="ingestion_bookshop", # Nom exact de ton premier DAG
        wait_for_completion=True # Crucial : attend que l'ingestion finisse avant d'aller au dbt run
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command="cd /opt/airflow/dbt/exam_tech_bigdata && dbt run"
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command="cd /opt/airflow/dbt/exam_tech_bigdata && dbt test"
    )

    ingestion >> dbt_run >> dbt_test
