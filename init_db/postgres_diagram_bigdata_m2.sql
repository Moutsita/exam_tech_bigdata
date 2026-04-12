-- Création des tables dans le schéma public de Postgres (Source locale)
CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    intitule VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES category(id),
    code VARCHAR(30),
    intitule VARCHAR(100),
    isbn_10 VARCHAR(30),
    isbn_13 VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    code VARCHAR(30),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE factures (
    id SERIAL PRIMARY KEY,
    code VARCHAR(30),
    date_edit VARCHAR(30), -- Format YYYYMMDD [cite: 271]
    customers_id INTEGER REFERENCES customers(id),
    qte_totale INTEGER,
    total_amount FLOAT,
    total_paid FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ventes (
    id SERIAL PRIMARY KEY,
    code VARCHAR(30),
    date_edit VARCHAR(30),
    factures_id INTEGER REFERENCES factures(id),
    books_id INTEGER REFERENCES books(id),
    pu FLOAT,
    qte INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);