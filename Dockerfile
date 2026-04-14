FROM apache/airflow:2.8.1

USER root
# Installation des dépendances système si nécessaire
RUN apt-get update && apt-get install -y git && apt-get clean

USER airflow
# Installation des connecteurs et de dbt
RUN pip install --no-cache-dir \
    apache-airflow-providers-snowflake \
    apache-airflow-providers-postgres \
    dbt-snowflake \
    psycopg2-binary