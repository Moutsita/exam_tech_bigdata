from airflow import DAG
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.providers.snowflake.operators.snowflake import SnowflakeOperator
from airflow.operators.python import PythonOperator
from datetime import datetime

def transfer_table(table_name):
    pg_hook = PostgresHook(postgres_conn_id='postgres_default')
    df = pg_hook.get_pandas_df(f"SELECT * FROM {table_name}")
    # Logique de chargement vers Snowflake ici (ou via S3/Stage)
    print(f"Extraction de {len(df)} lignes de la table {table_name}")

with DAG('ingestion_bookshop', start_date=datetime(2026, 4, 1), schedule_interval=None) as dag:
    # Ce DAG sera le point de départ de votre "Touche Personnelle"
    task_init = PythonOperator(
        task_id='transfer_category',
        python_callable=transfer_table,
        op_kwargs={'table_name': 'category'}
    )