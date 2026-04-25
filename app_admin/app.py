import streamlit as st
import psycopg2
import pandas as pd

# Configuration
st.set_page_config(page_title="Bookshop Admin", layout="wide", page_icon="📊")

# Connexion sécurisée au container postgres_source
def get_connection():
    return psycopg2.connect(
        host="postgres_source",
        database="bookshop",
        user="user",
        password="password",
        port="5432"
    )

# --- MENU LATÉRAL ---
st.sidebar.image("https://cdn-icons-png.flaticon.com/512/2742/2742635.png", width=100)
st.sidebar.title("Navigation")
page = st.sidebar.selectbox("Choisir une table", ["Livres", "Clients", "Ventes", "Factures"])

# --- FONCTION POUR RÉCUPÉRER LES DONNÉES ---
def fetch_data(table_name):
    conn = get_connection()
    query = f"SELECT * FROM {table_name};"
    df = pd.read_sql(query, conn)
    conn.close()
    return df

# --- PAGE LIVRES ---
if page == "Livres":
    st.title("📖 Gestion des Livres")
    
    # 1. Affichage des données existantes
    st.subheader("Données actuelles dans PostgreSQL")
    df_books = fetch_data("books")
    st.dataframe(df_books, use_container_width=True)

    # 2. Formulaire d'insertion
    with st.expander("➕ Ajouter un nouveau livre"):
        with st.form("form_livre"):
            col1, col2 = st.columns(2)
            new_id = col1.number_input("ID", step=1, value=int(df_books['id'].max() + 1) if not df_books.empty else 1)
            title = col2.text_input("Titre du livre")
            author = col1.text_input("Auteur")
            price = col2.number_input("Prix", format="%.2f")
            cat_id = st.number_input("ID Catégorie", step=1)
            
            if st.form_submit_button("Insérer dans Postgres"):
                try:
                    conn = get_connection()
                    cur = conn.cursor()
                    cur.execute("INSERT INTO books (id, title, author, price, category_id) VALUES (%s, %s, %s, %s, %s)",
                                (new_id, title, author, price, cat_id))
                    conn.commit()
                    st.success(f"Livre '{title}' ajouté !")
                    st.rerun() # Recharge la page pour voir le nouveau livre dans le tableau
                except Exception as e:
                    st.error(f"Erreur : {e}")

# --- PAGE CLIENTS ---
elif page == "Clients":
    st.title("👥 Gestion des Clients")
    df_clients = fetch_data("customers")
    st.dataframe(df_clients, use_container_width=True)
    
    with st.expander("➕ Ajouter un client"):
        with st.form("form_client"):
            c_id = st.number_input("ID Client", step=1)
            name = st.text_input("Nom complet")
            email = st.text_input("Email")
            if st.form_submit_button("Enregistrer"):
                conn = get_connection()
                cur = conn.cursor()
                cur.execute("INSERT INTO customers (id, name, email) VALUES (%s, %s, %s)", (c_id, name, email))
                conn.commit()
                st.rerun()
















# ---------------------------------------------------------


# import streamlit as st
# import psycopg2
# from psycopg2 import sql

# # Configuration de la page
# st.set_page_config(page_title="Admin Bookshop - Insertion", layout="centered")

# # 1. Fonction de connexion (à adapter avec tes accès Docker/Local)
# def get_connection():
#     return psycopg2.connect(
#         host="postgres_source", # ou le nom du service si dans Docker
#         database="bookshop",
#         user="user",
#         password="password",
#         port="5432"
#     )

# st.title("📚 Bookshop Data Entry")
# st.markdown("Insérez manuellement de nouveaux enregistrements dans PostgreSQL.")

# # 2. Formulaire d'insertion pour la table BOOKS
# with st.expander("Ajouter un nouveau Livre"):
#     with st.form("form_books"):
#         book_id = st.number_input("ID du livre", step=1)
#         title = st.text_input("Titre du livre")
#         author = st.text_input("Auteur")
#         category_id = st.number_input("ID Catégorie", step=1)
#         price = st.number_input("Prix", format="%.2f")
        
#         submitted = st.form_submit_button("Enregistrer le livre")
        
#         if submitted:
#             try:
#                 conn = get_connection()
#                 cur = conn.cursor()
#                 query = "INSERT INTO books (id, title, author, category_id, price) VALUES (%s, %s, %s, %s, %s)"
#                 cur.execute(query, (book_id, title, author, category_id, price))
#                 conn.commit()
#                 st.success(f"Livre '{title}' ajouté avec succès !")
#                 cur.close()
#                 conn.close()
#             except Exception as e:
#                 st.error(f"Erreur : {e}")

# # 3. Formulaire d'insertion pour la table VENTES
# with st.expander("Enregistrer une Vente"):
#     with st.form("form_sales"):
#         sale_id = st.number_input("ID Vente", step=1)
#         book_id_sale = st.number_input("ID Livre vendu", step=1)
#         quantity = st.number_input("Quantité", min_value=1, step=1)
#         sale_date = st.date_input("Date de vente")
        
#         submitted_sale = st.form_submit_button("Valider la vente")
        
#         if submitted_sale:
#             try:
#                 conn = get_connection()
#                 cur = conn.cursor()
#                 query = "INSERT INTO sales (id, book_id, quantity, sale_date) VALUES (%s, %s, %s, %s)"
#                 cur.execute(query, (sale_id, book_id_sale, quantity, sale_date))
#                 conn.commit()
#                 st.success("Vente enregistrée !")
#                 cur.close()
#                 conn.close()
#             except Exception as e:
#                 st.error(f"Erreur : {e}")