-- Etape 5 --
CREATE TABLE Serveurs (
    id      SERIAL PRIMARY KEY,
    nom     TEXT,
    prenom  TEXT
);

CREATE TABLE Tables (
    id      SERIAL PRIMARY KEY,
    nom     TEXT
);

ALTER TABLE Commandes
    ADD COLUMN serveurId INTEGER NULL;

ALTER TABLE Commandes
    ADD CONSTRAINT fk_commandes_serveur
    FOREIGN KEY (serveurId) REFERENCES Serveurs(id);

ALTER TABLE Commandes
    ADD COLUMN tableId INTEGER NULL;

ALTER TABLE Commandes
    ADD CONSTRAINT fk_commandes_table
    FOREIGN KEY (tableId) REFERENCES Tables(id);