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
    
-- Etape 3 --
    -- Insertion donnee de test --
    INSERT INTO Commandes(date) VALUES('2026-10-16');
    INSERT INTO Commandes(date) VALUES('2026-10-17');
    INSERT INTO Commandes(date) VALUES('2026-10-18');

    INSERT INTO Commandeplats(commandeid, platid, quantite) VALUES(1,1,1);
    INSERT INTO Commandeplats(commandeid, platid, quantite) VALUES(1,2,2);
    INSERT INTO Commandeplats(commandeid, platid, quantite) VALUES(1,3,3);

    INSERT INTO Commandeplats(commandeid, platid, quantite) VALUES(2,1,4);
    INSERT INTO Commandeplats(commandeid, platid, quantite) VALUES(2,2,5);
    INSERT INTO Commandeplats(commandeid, platid, quantite) VALUES(2,3,6);

    INSERT INTO Commandeplats(commandeid, platid, quantite) VALUES(3,1,7);
    INSERT INTO Commandeplats(commandeid, platid, quantite) VALUES(3,2,8);
    INSERT INTO Commandeplats(commandeid, platid, quantite) VALUES(3,3,9);

    -- Verification du montant total de chaque comande --
    SELECT 
        c.id AS commande_id, 
        SUM(cp.quantite * p.prix) AS montant_total
    FROM Commandes c
    JOIN commandeplats cp ON cp.commandeid = c.id
    JOIN Plat p ON p.id = cp.platid
    GROUP BY c.id
    ORDER BY c.id;

-- Etape 4 --
    -- Insertion donnee de test --
    INSERT INTO Clients(nom,prenom) VALUES ('CHIU TIEN','Mandresy Christian');

    -- Attribution de quelque commade a ce client --
    UPDATE Commandes SET clientId = 1 WHERE id = 1;

    -- Recuperation des commandes avec les clients --
    SELECT co.id, co.date, cl.nom,
        CASE WHEN
            co.clientid IS NULL THEN 'Client de passage' 
        END
    FROM Commandes as co 
    LEFT JOIN Clients as cl
    ON co.clientid = cl.id;