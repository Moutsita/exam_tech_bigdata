/* -----------------------------------------------------------------------
------------- INSERTION DES DONNEES DANS LES TABLES DE RAW --------------
 ----------------------------------------------------------------------- */

/* Script exécutable pour Snowflake */

 -- Accès à la BD
 USE DATABASE BOOKSHOP;

-- Accès au schéma RAW
 USE SCHEMA RAW;


/* -------------------------------------------------
---------------- Table N°1 : Cateogry ----------
-------------------------------------------------- */

INSERT INTO category (intitule, created_at) VALUES
('Roman', CURRENT_TIMESTAMP),
('Science-Fiction', CURRENT_TIMESTAMP),
('Fantasy', CURRENT_TIMESTAMP),
('Biographie', CURRENT_TIMESTAMP),
('Histoire', CURRENT_TIMESTAMP),
('Policier', CURRENT_TIMESTAMP),
('Thriller', CURRENT_TIMESTAMP),
('Jeunesse', CURRENT_TIMESTAMP),
('Art', CURRENT_TIMESTAMP),
('Informatique', CURRENT_TIMESTAMP),
('Santé', CURRENT_TIMESTAMP),
('Cuisine', CURRENT_TIMESTAMP),
('Voyage', CURRENT_TIMESTAMP),
('Sport', CURRENT_TIMESTAMP),
('Philosophie', CURRENT_TIMESTAMP),
('Religion', CURRENT_TIMESTAMP),
('Droit', CURRENT_TIMESTAMP),
('Économie', CURRENT_TIMESTAMP),
('Scolaire', CURRENT_TIMESTAMP),
('Bande dessinée', CURRENT_TIMESTAMP),
('Poésie', CURRENT_TIMESTAMP),
('Théâtre', CURRENT_TIMESTAMP),
('Linguistique', CURRENT_TIMESTAMP),
('Médecine', CURRENT_TIMESTAMP),
('Ingénierie', CURRENT_TIMESTAMP),
('Littérature africaine', CURRENT_TIMESTAMP),
('Histoire africaine', CURRENT_TIMESTAMP),
('Éducation', CURRENT_TIMESTAMP),
('Entrepreneuriat', CURRENT_TIMESTAMP),
('Agriculture', CURRENT_TIMESTAMP),
('Développement personnel', CURRENT_TIMESTAMP),
('Cuisine africaine', CURRENT_TIMESTAMP),
('Sciences sociales', CURRENT_TIMESTAMP);

/* -------------------------------------------------
---------------- Table N°2 : Books ----------
-------------------------------------------------- */

INSERT INTO books (category_id, code, intitule, isbn_10, isbn_13, created_at) VALUES
(8, 'BK001', 'Le Petit Prince', '1234567890', '9781234567890', CURRENT_TIMESTAMP),
(2, 'BK002', '1984', '2345678901', '9782345678901', CURRENT_TIMESTAMP),
(2, 'BK003', 'Dune', '3456789012', '9783456789012', CURRENT_TIMESTAMP),
(2, 'BK004', 'Le Meilleur des mondes', '4567890123', '9784567890123', CURRENT_TIMESTAMP),
(1, 'BK005', 'Les Misérables', '5678901234', '9785678901234', CURRENT_TIMESTAMP),
(10, 'BK006', 'Clean Code', '6789012345', '9786789012345', CURRENT_TIMESTAMP),
(10, 'BK007', 'Introduction à l’IA', '7890123456', '9787890123456', CURRENT_TIMESTAMP),
(15, 'BK008', 'Art de la guerre', '8901234567', '9788901234567', CURRENT_TIMESTAMP),
(12, 'BK009', 'Cuisine française', '9012345678', '9789012345678', CURRENT_TIMESTAMP),
(13, 'BK010', 'Voyage au Tibet', '0123456789', '9780123456789', CURRENT_TIMESTAMP),
(7, 'BK011', 'Le Signal', '1122334455', '9781122334455', CURRENT_TIMESTAMP),
(10, 'BK012', 'SQL pour les nuls', '2233445566', '9782233445566', CURRENT_TIMESTAMP),
(10, 'BK013', 'Python avancé', '3344556677', '9783344556677', CURRENT_TIMESTAMP),
(11, 'BK014', 'Le Corps humain', '4455667788', '9784455667788', CURRENT_TIMESTAMP),
(5, 'BK015', 'Histoire de France', '5566778899', '9785566778899', CURRENT_TIMESTAMP),
(4, 'BK016', 'Napoléon', '6677889900', '9786677889900', CURRENT_TIMESTAMP),
(6, 'BK017', 'Sherlock Holmes', '7788990011', '9787788990011', CURRENT_TIMESTAMP),
(7, 'BK018', 'Le Silence des agneaux', '8899001122', '9788899001122', CURRENT_TIMESTAMP),
(21, 'BK019', 'Poèmes choisis', '9900112233', '9789900112233', CURRENT_TIMESTAMP),
(22, 'BK020', 'Hamlet', '0011223344', '9780011223344', CURRENT_TIMESTAMP),
(18, 'BK021', 'Le Capital', '1122334400', '9781122334400', CURRENT_TIMESTAMP),
(17, 'BK022', 'Droit des contrats', '2233445511', '9782233445511', CURRENT_TIMESTAMP),
(11, 'BK023', 'Yoga et méditation', '3344556622', '9783344556622', CURRENT_TIMESTAMP),
(14, 'BK024', 'Football total', '4455667733', '9784455667733', CURRENT_TIMESTAMP),
(24, 'BK025', 'Astronomie moderne', '5566778844', '9785566778844', CURRENT_TIMESTAMP),
(1, 'BK026', 'L’Enfant noir', '1234567800', '9781234567800', CURRENT_TIMESTAMP),
(1, 'BK027', 'Les Soleils des indépendances', '2345678999', '9782345678999', CURRENT_TIMESTAMP),
(1, 'BK028', 'Une si longue lettre', '3456789088', '9783456789088', CURRENT_TIMESTAMP),
(5, 'BK029', 'Afrique contemporaine', '4567890177', '9784567890177', CURRENT_TIMESTAMP),
(18, 'BK030', 'Développement économique en Afrique', '5678901266', '9785678901266', CURRENT_TIMESTAMP),
(10, 'BK031', 'Initiation à Python', '6789012355', '9786789012355', CURRENT_TIMESTAMP),
(18, 'BK032', 'Agriculture au Bénin', '7890123444', '9787890123444', CURRENT_TIMESTAMP),
(5, 'BK033', 'Histoire du Congo-Brazzaville', '8901234533', '9788901234533', CURRENT_TIMESTAMP),
(12, 'BK034', 'Cuisine africaine', '9012345622', '9789012345622', CURRENT_TIMESTAMP),
(18, 'BK035', 'Entrepreneuriat en Afrique', '0123456711', '9780123456711', CURRENT_TIMESTAMP);

/* -------------------------------------------------
---------------- Table N°3 : Customers ----------
-------------------------------------------------- */

INSERT INTO customers (code, first_name, last_name, created_at) VALUES
('C001', 'Jean', 'Dupont', CURRENT_TIMESTAMP),
('C002', 'Marie', 'Curie', CURRENT_TIMESTAMP),
('C003', 'Paul', 'Martin', CURRENT_TIMESTAMP),
('C004', 'Sophie', 'Durand', CURRENT_TIMESTAMP),
('C005', 'Lucas', 'Bernard', CURRENT_TIMESTAMP),
('C006', 'Julie', 'Robert', CURRENT_TIMESTAMP),
('C007', 'Nicolas', 'Richard', CURRENT_TIMESTAMP),
('C008', 'Camille', 'Petit', CURRENT_TIMESTAMP),
('C009', 'Thomas', 'Moreau', CURRENT_TIMESTAMP),
('C010', 'Laura', 'Simon', CURRENT_TIMESTAMP),
('C011', 'Alex', 'Michel', CURRENT_TIMESTAMP),
('C012', 'Emma', 'Lefevre', CURRENT_TIMESTAMP),
('C013', 'Hugo', 'Leroy', CURRENT_TIMESTAMP),
('C014', 'Chloe', 'Roux', CURRENT_TIMESTAMP),
('C015', 'Maxime', 'David', CURRENT_TIMESTAMP),
('C016', 'Sarah', 'Bertrand', CURRENT_TIMESTAMP),
('C017', 'Antoine', 'Faure', CURRENT_TIMESTAMP),
('C018', 'Lisa', 'Garcia', CURRENT_TIMESTAMP),
('C019', 'Romain', 'Lopez', CURRENT_TIMESTAMP),
('C020', 'Manon', 'Blanc', CURRENT_TIMESTAMP),
('C021', 'Kevin', 'Garnier', CURRENT_TIMESTAMP),
('C022', 'Alice', 'Moulin', CURRENT_TIMESTAMP),
('C023', 'Jules', 'Chevalier', CURRENT_TIMESTAMP),
('C024', 'Lea', 'Francois', CURRENT_TIMESTAMP),
('C025', 'Bastien', 'Legrand', CURRENT_TIMESTAMP),
('C026', 'Aristide', 'Adjanohoun', CURRENT_TIMESTAMP),
('C027', 'Claudine', 'Koumba', CURRENT_TIMESTAMP),
('C028', 'Rodrigue', 'Mabiala', CURRENT_TIMESTAMP),
('C029', 'Sandrine', 'Gnacadja', CURRENT_TIMESTAMP),
('C030', 'Brice', 'Tchicaya', CURRENT_TIMESTAMP),
('C031', 'Estelle', 'Dossou', CURRENT_TIMESTAMP),
('C032', 'Patrick', 'Lissouba', CURRENT_TIMESTAMP),
('C033', 'Aline', 'Houngbedji', CURRENT_TIMESTAMP),
('C034', 'Serge', 'Ngoma', CURRENT_TIMESTAMP),
('C035', 'Mireille', 'Boukaka', CURRENT_TIMESTAMP);

/* -------------------------------------------------
---------------- Table 4 : Factures ----------
-------------------------------------------------- */

INSERT INTO factures (code, date_edit, customers_id, qte_totale, total_amount, total_paid, created_at) VALUES
('F001', '2025-03-01', 1, 2, 21000, 21000, CURRENT_TIMESTAMP),
('F002', '2025-03-02', 2, 1, 16500, 16500, CURRENT_TIMESTAMP),
('F003', '2025-03-03', 3, 3, 23500, 23500, CURRENT_TIMESTAMP),
('F004', '2025-03-04', 4, 1, 12000, 12000, CURRENT_TIMESTAMP),
('F005', '2025-03-05', 5, 2, 39000, 39000, CURRENT_TIMESTAMP),
('F006', '2025-03-06', 6, 1, 29500, 29500, CURRENT_TIMESTAMP),
('F007', '2025-03-07', 7, 2, 28500, 28500, CURRENT_TIMESTAMP),
('F008', '2025-03-08', 8, 1, 9500, 9500, CURRENT_TIMESTAMP),
('F009', '2025-03-09', 9, 3, 39000, 39000, CURRENT_TIMESTAMP),
('F010', '2025-03-10', 10, 1, 18000, 18000, CURRENT_TIMESTAMP),
('F011', '2025-03-11', 11, 2, 21000, 21000, CURRENT_TIMESTAMP),
('F012', '2025-03-12', 12, 1, 21500, 21500, CURRENT_TIMESTAMP),
('F013', '2025-03-13', 13, 2, 32500, 32500, CURRENT_TIMESTAMP),
('F014', '2025-03-14', 14, 3, 22500, 22500, CURRENT_TIMESTAMP),
('F015', '2025-03-15', 15, 1, 19500, 19500, CURRENT_TIMESTAMP),
('F016', '2025-03-16', 16, 2, 27500, 27500, CURRENT_TIMESTAMP),
('F017', '2025-03-17', 17, 1, 11500, 11500, CURRENT_TIMESTAMP),
('F018', '2025-03-18', 18, 2, 41500, 41500, CURRENT_TIMESTAMP),
('F019', '2025-03-19', 19, 3, 27500, 27500, CURRENT_TIMESTAMP),
('F020', '2025-03-20', 20, 1, 18000, 18000, CURRENT_TIMESTAMP),
('F021', '2025-03-21', 21, 2, 26000, 26000, CURRENT_TIMESTAMP),
('F022', '2025-03-22', 22, 1, 22500, 22500, CURRENT_TIMESTAMP),
('F023', '2025-03-23', 23, 2, 34500, 34500, CURRENT_TIMESTAMP),
('F024', '2025-03-24', 24, 3, 35000, 35000, CURRENT_TIMESTAMP),
('F025', '2025-03-25', 25, 1, 26000, 26000, CURRENT_TIMESTAMP);

/* -------------------------------------------------
---------------- Table N°5 : Ventes ----------
-------------------------------------------------- */

INSERT INTO ventes (code, date_edit, factures_id, books_id, pu, qte, created_at) VALUES
-- Prix en CFA
('V001', '2025-03-01', 1, 1, 10500, 2, CURRENT_TIMESTAMP),
('V002', '2025-03-02', 2, 2, 16500, 1, CURRENT_TIMESTAMP),
('V003', '2025-03-03', 3, 3, 7800, 3, CURRENT_TIMESTAMP),
('V004', '2025-03-04', 4, 4, 12200, 1, CURRENT_TIMESTAMP),
('V005', '2025-03-05', 5, 5, 19500, 2, CURRENT_TIMESTAMP),
('V006', '2025-03-06', 6, 6, 29000, 1, CURRENT_TIMESTAMP),
('V007', '2025-03-07', 7, 7, 14300, 2, CURRENT_TIMESTAMP),
('V008', '2025-03-08', 8, 8, 9700, 1, CURRENT_TIMESTAMP),
('V009', '2025-03-09', 9, 9, 13000, 3, CURRENT_TIMESTAMP),
('V010', '2025-03-10', 10, 10, 17800, 1, CURRENT_TIMESTAMP),
('V011', '2025-03-11', 11, 11, 10400, 2, CURRENT_TIMESTAMP),
('V012', '2025-03-12', 12, 12, 21500, 1, CURRENT_TIMESTAMP),
('V013', '2025-03-13', 13, 13, 16200, 2, CURRENT_TIMESTAMP),
('V014', '2025-03-14', 14, 14, 7500, 3, CURRENT_TIMESTAMP),
('V015', '2025-03-15', 15, 15, 19500, 1, CURRENT_TIMESTAMP),
('V026', '2025-03-01', 1, 1, 5000, 1, CURRENT_TIMESTAMP),
('V027', '2025-03-02', 2, 2, 7000, 1, CURRENT_TIMESTAMP),
('V028', '2025-03-03', 3, 3, 4500, 2, CURRENT_TIMESTAMP),
('V029', '2025-03-04', 4, 4, 6000, 1, CURRENT_TIMESTAMP),
('V030', '2025-03-05', 5, 5, 8000, 1, CURRENT_TIMESTAMP),
('V031', '2025-03-06', 6, 6, 6500, 1, CURRENT_TIMESTAMP),
('V032', '2025-03-07', 7, 7, 4000, 2, CURRENT_TIMESTAMP),
('V033', '2025-03-08', 8, 8, 5500, 1, CURRENT_TIMESTAMP),
('V034', '2025-03-09', 9, 9, 6000, 1, CURRENT_TIMESTAMP),
('V035', '2025-03-10', 10, 10, 7500, 1, CURRENT_TIMESTAMP);

