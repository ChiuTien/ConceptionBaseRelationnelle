-- Etape 3 --
CREATE TABLE Commandes (
    id      SERIAL PRIMARY KEY,
    date    DATE
);

CREATE TABLE CommandePlats (
    id          SERIAL PRIMARY KEY,
    commandeId  INTEGER,
    platId      INTEGER,
    quantite    INTEGER,

    FOREIGN KEY (commandeId) REFERENCES Commandes(id),
    FOREIGN KEY (platId) REFERENCES Plat(id)
);