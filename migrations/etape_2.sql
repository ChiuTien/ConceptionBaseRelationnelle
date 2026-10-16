-- Etape 2 --
CREATE TABLE Categorie(
    id      SERIAL PRIMARY KEY,
    libelle TEXT
);

-- RAJOUT COLONNE --
ALTER TABLE Plat 
    ADD COLUMN categorieId INTEGER;

-- RAJOUT D'UNE CONTRAINTE --
ALTER TABLE Plat
    ADD CONSTRAINT fk_plat_categorie
    FOREIGN KEY (categorieId)
    REFERENCES Categorie(id);

-- SUPPRESSION DE LA COLONNE CATEGORIE INITIAL (les donnees ont deja ete changer) --
ALTER TABLE Plat
    DROP COLUMN IF EXISTS categorie;