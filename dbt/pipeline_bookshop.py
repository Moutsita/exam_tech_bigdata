# Orchestration Airflow + DBT
from airflow.operators.bash import BashOperator

dbt_run = BashOperator(
    task_id="dbt_run",
    bash_command="cd /opt/airflow/dbt/exam_tech_bigdata && dbt run"
)

dbt_test = BashOperator(
    task_id="dbt_test",
    bash_command="cd /opt/airflow/dbt/exam_tech_bigdata && dbt test"
)

# Orchestration
ingestion >> dbt_run >> dbt_test