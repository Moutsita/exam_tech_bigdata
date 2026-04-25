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
    dbt-core \
    psycopg2-binary


# Construction de l'image streamlit
# 1. On copie le fichier requirements depuis ton dossier local vers le container
COPY ./app_admin/requirements.txt /tmp/requirements_streamlit.txt

# 2. Installation des dépendances pour Streamlit et Postgres
RUN pip install --no-cache-dir -r /tmp/requirements_streamlit.txt