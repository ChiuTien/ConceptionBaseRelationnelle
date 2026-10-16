-- Etape 4 --
CREATE TABLE Clients (
    id      SERIAL PRIMARY KEY,
    nom     TEXT,
    prenom  TEXT
);

ALTER TABLE Commandes
    ADD COLUMN clientId INTEGER NULL;

ALTER TABLE Commandes
    ADD CONSTRAINT fk_client_commandes
    FOREIGN KEY (clientId) 
    REFERENCES Clients(id);