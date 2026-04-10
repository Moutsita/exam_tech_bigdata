/* -----------------------------------------------------------------------
------------- INSERTION DES DONNEES DANS LES TABLES DE RAW --------------
 -----------------------------------------------------------------------*/

/* Remplacer la valeur de la clé primaire auto_incrément
 par la valeur NULL */

 ----- Table N°1 : Category ------------
INSERT INTO category (id, intitule, created_at) VALUES
(NULL, 'Littérature africaine', CURRENT_TIMESTAMP),
(NULL, 'Roman', CURRENT_TIMESTAMP),
(NULL, 'Histoire africaine', CURRENT_TIMESTAMP),
(NULL, 'Éducation', CURRENT_TIMESTAMP),
(NULL, 'Économie', CURRENT_TIMESTAMP),
(NULL, 'Entrepreneuriat', CURRENT_TIMESTAMP),
(NULL, 'Agriculture', CURRENT_TIMESTAMP),
(NULL, 'Santé', CURRENT_TIMESTAMP),
(NULL, 'Informatique', CURRENT_TIMESTAMP),
(NULL, 'Développement personnel', CURRENT_TIMESTAMP),
(NULL, 'Religion', CURRENT_TIMESTAMP),
(NULL, 'Cuisine africaine', CURRENT_TIMESTAMP),
(NULL, 'Jeunesse', CURRENT_TIMESTAMP),
(NULL, 'Droit', CURRENT_TIMESTAMP),
(NULL, 'Sciences sociales', CURRENT_TIMESTAMP);

----- Table N°2: Books -----
INSERT INTO books (id, code, intitule, isbn_10, isbn_13, category_id) VALUES
(NULL, 'BK001', 'L’Enfant noir', '1234567890', '9781234567890', 1),
(NULL, 'BK002', 'Les Soleils des indépendances', '2345678901', '9782345678901', 1),
(NULL, 'BK003', 'Une si longue lettre', '3456789012', '9783456789012', 1),
(NULL, 'BK004', 'Afrique contemporaine', '4567890123', '9784567890123', 5),
(NULL, 'BK005', 'Développement économique en Afrique', '5678901234', '9785678901234', 18),
(NULL, 'BK006', 'Initiation à Python', '6789012345', '9786789012345', 10),
(NULL, 'BK007', 'Agriculture au Bénin', '7890123456', '9787890123456', 18),
(NULL, 'BK008', 'Histoire du Congo-Brazzaville', '8901234567', '9788901234567', 5),
(NULL, 'BK009', 'Cuisine africaine', '9012345678', '9789012345678', 12),
(NULL, 'BK010', 'Entrepreneuriat en Afrique', '0123456789', '9780123456789', 18);


----- Table N°3: Customers ------

INSERT INTO customers (id, code, first_name, last_name, email) VALUES
(NULL, 'C001', 'Aristide', 'Adjanohoun', 'aristide.adjanohoun@mail.com'),
(NULL, 'C002', 'Claudine', 'Koumba', 'claudine.koumba@mail.com'),
(NULL, 'C003', 'Rodrigue', 'Mabiala', 'rodrigue.mabiala@mail.com'),
(NULL, 'C004', 'Sandrine', 'Gnacadja', 'sandrine.gnacadja@mail.com'),
(NULL, 'C005', 'Brice', 'Tchicaya', 'brice.tchicaya@mail.com'),
(NULL, 'C006', 'Estelle', 'Dossou', 'estelle.dossou@mail.com'),
(NULL, 'C007', 'Patrick', 'Lissouba', 'patrick.lissouba@mail.com'),
(NULL, 'C008', 'Aline', 'Houngbedji', 'aline.houngbedji@mail.com'),
(NULL, 'C009', 'Serge', 'Ngoma', 'serge.ngoma@mail.com'),
(NULL, 'C010', 'Mireille', 'Boukaka', 'mireille.boukaka@mail.com'); 

----- Table N°4:  Facures -------
NSERT INTO ventes (id, date_edit, pu, qte, book_id, customer_id) VALUES
(NULL, '2025-03-01', 5000, 1, 1, 1),
(NULL, '2025-03-02', 7000, 1, 2, 2),
(NULL, '2025-03-03', 4500, 2, 3, 3),
(NULL, '2025-03-04', 6000, 1, 4, 4),
(NULL, '2025-03-05', 8000, 1, 5, 5);

----- Table N°5 : Ventes ------------
INSERT INTO ventes (id, date_edit, pu, qte, book_id, customer_id) VALUES
(NULL, '2025-03-06', 6500, 1, 6, 6),
(NULL, '2025-03-07', 4000, 2, 7, 7),
(NULL, '2025-03-08', 5500, 1, 8, 8),
(NULL, '2025-03-09', 6000, 1, 9, 9),
(NULL, '2025-03-10', 7500, 1, 10, 10),

(NULL, '2025-03-11', 5000, 2, 1, 2),
(NULL, '2025-03-12', 7000, 1, 2, 3),
(NULL, '2025-03-13', 4500, 3, 3, 4),
(NULL, '2025-03-14', 6000, 1, 4, 5),
(NULL, '2025-03-15', 8000, 1, 5, 6),

(NULL, '2025-03-16', 6500, 2, 6, 7),
(NULL, '2025-03-17', 4000, 1, 7, 8),
(NULL, '2025-03-18', 5500, 2, 8, 9),
(NULL, '2025-03-19', 6000, 1, 9, 10),
(NULL, '2025-03-20', 7500, 2, 10, 1),

(NULL, '2025-03-21', 5000, 1, 1, 3),
(NULL, '2025-03-22', 7000, 2, 2, 4),
(NULL, '2025-03-23', 4500, 1, 3, 5),
(NULL, '2025-03-24', 6000, 2, 4, 6),
(NULL, '2025-03-25', 8000, 1, 5, 7);