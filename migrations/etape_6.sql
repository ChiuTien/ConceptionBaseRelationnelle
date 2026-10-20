-- Etape 6--
CREATE TABLE TypePaiements (
    id      SERIAL PRIMARY KEY,
    libelle TEXT NOT NULL UNIQUE
);

CREATE TABLE Paiements (
    id          SERIAL PRIMARY KEY,
    typeId      INTEGER,
    commandeId  INTEGER,
    montant     INTEGER,

    FOREIGN KEY (typeId) REFERENCES TypePaiements(id),
    FOREIGN KEY (commandeId) REFERENCES Commandes(id)
);