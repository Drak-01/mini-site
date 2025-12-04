-- ======================================
-- Table etudiant
-- ======================================
CREATE TABLE etudiant (
    id_etu INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    cin VARCHAR(20) NOT NULL UNIQUE
);

-- Données exemples
INSERT INTO etudiant (nom, prenom, cin) VALUES
('Keita', 'Badra', 'CIN001'),
('Traore', 'Aminata', 'CIN002'),
('Diallo', 'Moussa', 'CIN003');

-- ======================================
-- Table module
-- ======================================
CREATE TABLE module (
    id_mod INT AUTO_INCREMENT PRIMARY KEY,
    lib_mod VARCHAR(100) NOT NULL
);

-- Données exemples
INSERT INTO module (lib_mod) VALUES
('Mathematiques'),
('Physique'),
('Informatique'),
('Anglais');

-- ======================================
-- Table semestre
-- ======================================
CREATE TABLE semestre (
    id_sem INT AUTO_INCREMENT PRIMARY KEY,
    lib_sem VARCHAR(50) NOT NULL
);

-- Données exemples
INSERT INTO semestre (lib_sem) VALUES
('Semestre 1'),
('Semestre 2'),
('Semestre 3');

-- ======================================
-- Table inscription
-- ======================================
CREATE TABLE inscription (
    num INT AUTO_INCREMENT PRIMARY KEY,
    niveau TINYINT(1) NOT NULL, -- 0 = Débutant, 1 = Initié
    id_etu INT NOT NULL,
    id_sem INT NOT NULL,
    id_mod INT NOT NULL,
    date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_etu) REFERENCES etudiant(id_etu) ON DELETE CASCADE,
    FOREIGN KEY (id_sem) REFERENCES semestre(id_sem) ON DELETE CASCADE,
    FOREIGN KEY (id_mod) REFERENCES module(id_mod) ON DELETE CASCADE
);

-- Exemple d'inscription
INSERT INTO inscription (niveau, id_etu, id_sem, id_mod) VALUES
(0, 1, 1, 1),
(1, 2, 2, 3),
(0, 3, 1, 4);

-- ======================================
-- Table administrateur
-- ======================================
CREATE TABLE administrateur (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nom VARCHAR(100) DEFAULT NULL
);

-- Exemple d'admin (mot de passe en clair ici : 'admin123')
INSERT INTO administrateur (utilisateur, password, nom) VALUES
('admin', '$2y$12$rb0sTLU2ARw6asjdz/.Q1urij1N/VQ1OexDqDtQk0HVld7SGgNQYK', 'Administrateur');


