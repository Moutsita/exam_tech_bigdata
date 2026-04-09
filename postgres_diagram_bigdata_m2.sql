/* -----------------------------------------------------------------
---------------------- Script SQL de BOOKSHOP ----------------------
------------------------------------------------------------------*/

// ---------------- CREATION DE LA BASE DONNEE ---------------
CREATE DATABASE IF NOT EXISTS BOOKSHOP;

// ------- Utilisation de la base de donnée -------
USE BOOKSHOP;

--- Création des schémas ---
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS STAGGING;
CREATE SCHEMA IF NOT EXISTS WAREHOUSE;
CREATE SCHEMA IF NOT EXISTS MARTS;

/* -----------------------------------------------------------------
-------------------- Création des tables de RAW --------------------
------------------------------------------------------------------*/
USE RAW;

/* ------------ Table N°1: Category ------------------ */
CREATE TABLE IF NOT EXISTS category (
    id INTEGER AUTO_INCREMENT,
    intitule VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT pk_category PRIMARY KEY (id)
);

/* ------------ Table N°2: Books ------------------ */
CREATE TABLE IF NOT EXISTS books (
    id INTEGER AUTO_INCREMENT,
    category_id INTEGER,
    code VARCHAR(30),
    intitule VARCHAR(100),
    isbn_10 VARCHAR(30),
    isbn_13 VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),

    -- Clés primaire et étrangères --
    CONSTRAINT pk_books PRIMARY KEY(id),
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category(id)
);

/* ------------ Table N°3: costumers ------------------ */
CREATE TABLE IF NOT EXISTS customers(
    id INTEGER AUTO_INCREMENT,
    code VARCHAR(30),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),

    -- Clé primaire --
    CONSTRAINT pk_customers PRIMARY KEY(id)
);

/* ------------ Table N°4: Factures ------------------ */
CREATE TABLE IF NOT EXISTS factures(
    id INTEGER AUTO_INCREMENT,
    code VARCHAR(30),
    date_edit VARCHAR(30),
    customers_id INTEGER,
    qte_totale INTEGER,
    total_amount FLOAT,
    total_paid FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),

    -- Clés primaires et étrangères --
    CONSTRAINT pk_factures PRIMARY KEY(id),
    CONSTRAINT fk_costumers FOREIGN KEY (customers_id) REFERENCES customers(id)
);

/* ------------ Table N°5: Ventes ------------------ */
CREATE TABLE IF NOT EXISTS ventes(
    id INTEGER AUTO_INCREMENT,
    code VARCHAR(30),
    date_edit VARCHAR(30),
    factures_id INTEGER,
    books_id INTEGER,
    pu FLOAT,
    qte INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),

    -- Clés primaire et étrangères
    CONSTRAINT pk_ventes PRIMARY KEY(id),
    CONSTRAINT fk_books FOREIGN KEY(books_id) REFERENCES books(id),
    CONSTRAINT fk_factures FOREIGN KEY(factures_id) REFERENCES factures(id)
);