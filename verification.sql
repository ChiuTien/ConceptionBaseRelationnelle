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