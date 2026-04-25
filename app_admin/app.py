import streamlit as st
import psycopg2
import pandas as pd
import subprocess
import snowflake.connector
from config import SNOWFLAKE_CONN
import requests

# ==============================
# CONFIG PAGE
# ==============================
st.set_page_config(
    page_title="Admin Bookshop - RAW",
    layout="wide",
    page_icon="⚙️"
)

# ==============================
# CONNEXIONS
# ==============================
def get_pg_connection():
    return psycopg2.connect(
        host="postgres_source",
        database="bookshop",
        user="user",
        password="password",
        port="5432"
    )

def get_snowflake_connection():
    return snowflake.connector.connect(
        user=SNOWFLAKE_CONN['user'],
        password=SNOWFLAKE_CONN['password'],
        account=SNOWFLAKE_CONN['account'],
        warehouse=SNOWFLAKE_CONN['warehouse'],
        database=SNOWFLAKE_CONN['database'],
        schema='STAGGING_MARTS'
    )

# ==============================
# UTILS
# ==============================
def fetch_data(table_name):
    conn = get_pg_connection()
    df = pd.read_sql(f'SELECT * FROM raw."{table_name}" ORDER BY id DESC;', conn)
    conn.close()
    return df

def fetch_snowflake():
    try:
        conn = get_snowflake_connection()
        df = pd.read_sql("SELECT * FROM MARTS.obt_sales LIMIT 100", conn)
        conn.close()
        return df
    except Exception as e:
        st.error(f"Erreur Snowflake : {e}")
        return pd.DataFrame()

def get_options(query):
    conn = get_pg_connection()
    df = pd.read_sql(query, conn)
    conn.close()
    return df
#============================
# Fonction de choix du dag
#============================
def trigger_dag(dag_id):
    url = f"http://airflow_exam:8080/api/v1/dags/{dag_id}/dagRuns"
    
    response = requests.post(
        url,
        auth=("airflow", "airflow"),
        json={}
    )
    return response.status_code, response.text
# ==============================
# SIDEBAR
# ==============================
st.sidebar.title("🛠️ Navigation")

page = st.sidebar.selectbox("Choisir la table RAW",
    ["category", "books", "customers", "factures", "ventes"]
)

view_mode = st.sidebar.radio(
    "Mode",
    ["RAW (Postgres)", "MARTS (Snowflake)"]
)

# ==============================
# HEADER ACTIONS
# ==============================
st.title(f"Gestion : {page}")

col1, col2, col3, col4 = st.columns([1, 3, 1, 1])

with col1:
    show_form = st.toggle("➕ Ajouter")

with col2:
    st.caption("Active pour insérer de nouvelles données")

with col3:
    if st.button("🔄 Refresh"):
        st.rerun()

with col4:
    dag_choice = st.selectbox(
        "DAG",
        ["ingestion_bookshop", "pipeline_bookshop"],
        label_visibility="collapsed"
    )

    if st.button("🚀 Lancer pipeline"):
        status, text = trigger_dag(dag_choice)

        if status in [200, 201]:
            st.success(f"{dag_choice} lancé ✅")
        else:
            st.error(f"Erreur Airflow : {text}")
# with col4:
#     if st.button("🚀 Lancer pipeline"):
#         try:
#             subprocess.run(
#                 ["airflow", "dags", "trigger", "ingestion_bookshop"],
#                 check=True
#             )
#             st.success("Pipeline lancé ✅")
#         except Exception as e:
#             st.error(f"Erreur Airflow : {e}")

# ==============================
# FORMULAIRE
# ==============================
if show_form:

    if st.button("🧹 Reset formulaire"):
        st.rerun()

    st.subheader(f"Insertion dans raw.{page}")

    with st.form(f"form_{page}"):

        if page == "category":
            intitule = st.text_input("Intitulé *")

            if st.form_submit_button("Enregistrer"):
                if intitule:
                    conn = get_pg_connection()
                    cur = conn.cursor()
                    cur.execute("INSERT INTO raw.category (intitule) VALUES (%s)", (intitule,))
                    conn.commit()
                    cur.close()
                    conn.close()
                    st.success("Ajout réussi ✅")
                    st.rerun()

        elif page == "books":
            categories = get_options("SELECT id, intitule FROM raw.category")

            cat_id = st.selectbox(
                "Catégorie",
                categories["id"],
                format_func=lambda x: categories[categories["id"] == x]["intitule"].values[0]
            )

            code = st.text_input("Code *")
            intitule = st.text_input("Intitulé *")

            if st.form_submit_button("Enregistrer"):
                if code and intitule:
                    conn = get_pg_connection()
                    cur = conn.cursor()
                    cur.execute("""
                        INSERT INTO raw.books (category_id, code, intitule)
                        VALUES (%s, %s, %s)
                    """, (cat_id, code, intitule))
                    conn.commit()
                    cur.close()
                    conn.close()
                    st.success("Livre ajouté ✅")
                    st.rerun()

        elif page == "customers":
            code = st.text_input("Code *")
            first = st.text_input("Prénom *")
            last = st.text_input("Nom *")

            if st.form_submit_button("Enregistrer"):
                if code and first and last:
                    conn = get_pg_connection()
                    cur = conn.cursor()
                    cur.execute("""
                        INSERT INTO raw.customers (code, first_name, last_name)
                        VALUES (%s, %s, %s)
                    """, (code, first, last))
                    conn.commit()
                    cur.close()
                    conn.close()
                    st.success("Client ajouté ✅")
                    st.rerun()

        elif page == "factures":
            customers = get_options("SELECT id, code FROM raw.customers")

            code = st.text_input("Code *")
            date_edit = st.text_input("Date (string) *")

            cust_id = st.selectbox(
                "Client",
                customers["id"],
                format_func=lambda x: customers[customers["id"] == x]["code"].values[0]
            )

            if st.form_submit_button("Enregistrer"):
                if code and date_edit:
                    conn = get_pg_connection()
                    cur = conn.cursor()
                    cur.execute("""
                        INSERT INTO raw.factures (code, date_edit, customers_id)
                        VALUES (%s, %s, %s)
                    """, (code, date_edit, cust_id))
                    conn.commit()
                    cur.close()
                    conn.close()
                    st.success("Facture ajoutée ✅")
                    st.rerun()

        elif page == "ventes":
            factures = get_options("SELECT id, code FROM raw.factures")
            books = get_options("SELECT id, intitule FROM raw.books")

            code = st.text_input("Code *")
            date_edit = st.text_input("Date *")

            fac_id = st.selectbox("Facture", factures["id"])
            book_id = st.selectbox("Livre", books["id"])

            if st.form_submit_button("Enregistrer"):
                if code and date_edit:
                    conn = get_pg_connection()
                    cur = conn.cursor()
                    cur.execute("""
                        INSERT INTO raw.ventes (code, date_edit, factures_id, books_id)
                        VALUES (%s, %s, %s, %s)
                    """, (code, date_edit, fac_id, book_id))
                    conn.commit()
                    cur.close()
                    conn.close()
                    st.success("Vente ajoutée ✅")
                    st.rerun()

# ==============================
# AFFICHAGE DATA
# ==============================
if view_mode == "RAW (Postgres)":
    df = fetch_data(page)
    st.subheader("📄 Données RAW")
    st.dataframe(df, use_container_width=True)

else:
    df = fetch_snowflake()
    st.subheader("📊 MARTS - obt_sales")
    st.dataframe(df, use_container_width=True)

