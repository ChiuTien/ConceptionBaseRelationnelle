-- Etape 1 --
    -- Insertion donnee --
    INSERT INTO Plat(plat,categorie,prix) VALUES('Romazava','Plat malagasy',7000);
    INSERT INTO Plat(plat,categorie,prix) VALUES('Ravitoto sy henakisoa','Plat malagasy',8000);
    INSERT INTO Plat(plat,categorie,prix) VALUES('Akoho sy voanio','Plat malagasy',8500);
    INSERT INTO Plat(plat,categorie,prix) VALUES('Mi sao','Plat chinois',6000);
    INSERT INTO Plat(plat,categorie,prix) VALUES('Soupe chinoise','Plat chinois',5000);
    INSERT INTO Plat(plat,categorie,prix) VALUES('Mofo gasy','Dessert et gouter',1000);
    INSERT INTO Plat(plat,categorie,prix) VALUES('Ranon''apango','Boisson',7000);

    -- Affichage plat du plus cher au moins cher --
    SELECT * FROM PLAT ORDER BY prix DESC;

-- Etape 2 --
    -- Insertion donnee --
    INSERT INTO categorie(libelle) VALUES('Plat malagasy');
    INSERT INTO categorie(libelle) VALUES('Plat chinois');
    INSERT INTO categorie(libelle) VALUES('Soupe');
    INSERT INTO categorie(libelle) VALUES('Desserts');
    INSERT INTO categorie(libelle) VALUES('Boisson');

    -- Modification des donees -- 
    UPDATE Plat SET categorieId = 1 WHERE id = 1;
    UPDATE Plat SET categorieId = 1 WHERE id = 2;
    UPDATE Plat SET categorieId = 1 WHERE id = 3;
    UPDATE Plat SET categorieId = 2 WHERE id = 4;
    UPDATE Plat SET categorieId = 2 WHERE id = 5;
    UPDATE Plat SET categorieId = 4 WHERE id = 6;
    UPDATE Plat SET categorieId = 5 WHERE id = 7;

    -- Selection des nombres de plat par categorie --
    SELECT Categorie.libelle, COUNT(Plat.categorieid) AS nombre_plats
        FROM Categorie LEFT JOIN Plat 
        ON Categorie.id = Plat.categorieid
        GROUP BY Categorie.id, Categorie.libelle;