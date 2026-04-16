from airflow import DAG
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.operators.python import PythonOperator
from datetime import datetime
import snowflake.connector

# Liste des tables à transférer
TABLES = ['category', 'books', 'customers', 'factures', 'ventes']

def transfer_table(table_name):
    # 1. Connexion Postgres
    pg_hook = PostgresHook(postgres_conn_id='postgres_default')
    df = pg_hook.get_pandas_df(f"SELECT * FROM raw.{table_name}")

    if df.empty:
        print(f"⚠️ Table vide : {table_name}")
        return

    # 2. Connexion Snowflake
    conn = snowflake.connector.connect(
        user='Moutsita',
        password='RovMoutsita@93',
        account='af-south-1.aws/cy02594',
        warehouse='COMPUTE_WH',
        database='BOOKSHOP',
        schema='RAW'
    )
    cursor = conn.cursor()

    # 3. Nettoyage (optionnel mais recommandé)
    cursor.execute(f"DELETE FROM {table_name}")

    # 4. Insertion
    for _, row in df.iterrows():
        values = []
        for v in row.values:
            if v is None:
                values.append("NULL")
            else:
                values.append(str(v).replace("'", "''"))

        values_str = "', '".join(values)

        cursor.execute(f"""
            INSERT INTO {table_name}
            VALUES ('{values_str}')
        """)

    print(f"✅ {len(df)} lignes transférées : {table_name}")

# DAG
with DAG(
    dag_id='ingestion_bookshop',
    start_date=datetime(2026, 4, 1),
    schedule_interval=None,
    catchup=False
) as dag:

    tasks = []

    for table in TABLES:
        task = PythonOperator(
            task_id=f'transfer_{table}',
            python_callable=transfer_table,
            op_kwargs={'table_name': table}
        )
        tasks.append(task)