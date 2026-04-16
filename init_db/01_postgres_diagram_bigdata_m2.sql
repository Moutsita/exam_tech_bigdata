-- Création de la base (à exécuter hors connexion)
/*  CREATE DATABASE bookshop;  */

-- Ensuite se connecter à la base bookshop

-- Création des schémas
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS stagging;
CREATE SCHEMA IF NOT EXISTS warehouse;
CREATE SCHEMA IF NOT EXISTS marts;

-- =========================
-- TABLES RAW
-- =========================

CREATE TABLE raw.category (
    id SERIAL PRIMARY KEY,
    intitule VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.books (
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES raw.category(id),
    code VARCHAR(30),
    intitule VARCHAR(100),
    isbn_10 VARCHAR(30),
    isbn_13 VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.customers (
    id SERIAL PRIMARY KEY,
    code VARCHAR(30),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.factures (
    id SERIAL PRIMARY KEY,
    code VARCHAR(30),
    date_edit VARCHAR(30),
    customers_id INTEGER REFERENCES raw.customers(id),
    qte_totale INTEGER,
    total_amount FLOAT,
    total_paid FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE raw.ventes (
    id SERIAL PRIMARY KEY,
    code VARCHAR(30),
    date_edit VARCHAR(30),
    factures_id INTEGER REFERENCES raw.factures(id),
    books_id INTEGER REFERENCES raw.books(id),
    pu FLOAT,
    qte INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);