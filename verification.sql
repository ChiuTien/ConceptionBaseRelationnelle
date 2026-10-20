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
            ELSE 'Client habitue'
        END
    FROM Commandes as co 
    LEFT JOIN Clients as cl
    ON co.clientid = cl.id;

-- Etape 5 --
    -- Insertion donnee de test --
    INSERT INTO Serveurs(nom,prenom) VALUES('Njaka','Rakoto');
    INSERT INTO Serveurs(nom,prenom) VALUES('Lalao','Rasoa');

    INSERT INTO Tables(nom) VALUES('Table 1');
    INSERT INTO Tables(nom) VALUES('Table 2');
    INSERT INTO Tables(nom) VALUES('Table 3');
    INSERT INTO Tables(nom) VALUES('Table 4');
    INSERT INTO Tables(nom) VALUES('Table 5');
    INSERT INTO Tables(nom) VALUES('Table 6');
    INSERT INTO Tables(nom) VALUES('Table 7');
    INSERT INTO Tables(nom) VALUES('Table 8');

    UPDATE Commandes SET serveurId = 1, tableId = 1 WHERE id = 1;
    UPDATE Commandes SET serveurId = 2, tableId = 1 WHERE id = 2;
    UPDATE Commandes SET serveurId = NULL, tableId = NULL WHERE id = 3;

    -- Nombre de commande et chiffre d'affaire par serveur --
    SELECT 
        s.nom AS serveur,
        COUNT(DISTINCT c.id) AS nombre_commandes,
        SUM(cp.quantite * p.prix) AS montant_total
    FROM commandes c
    LEFT JOIN serveurs s ON s.id = c.serveurId
    LEFT JOIN commandeplats cp ON cp.commandeid = c.id
    LEFT JOIN Plat p ON p.id = cp.platid
    GROUP BY s.nom;

-- Etape 6 --
    -- Insertion donnee de test --
    INSERT INTO TypePaiements(libelle) VALUES('Especes');
    INSERT INTO TypePaiements(libelle) VALUES('MVola');
    INSERT INTO TypePaiements(libelle) VALUES('Orange Money');
    INSERT INTO TypePaiements(libelle) VALUES('Airtel Money');

    INSERT INTO Paiements(typeId,commandeId,montant) VALUES(1,1,10000);
    INSERT INTO Paiements(typeId,commandeId,montant) VALUES(2,1,5000);
    INSERT INTO Paiements(typeId,commandeId,montant) VALUES(3,2,6000);

    -- Liste des commandes non soldees avec le montant du, le montant payer et le reste a payer --
    SELECT 
        c.id AS id_commande,
        c.date AS date_commande,
        COALESCE(p_totaux.montant_payer, 0) AS montant_payer,
        COALESCE(cp_totaux.montant_du, 0) AS montant_du,
        (COALESCE(cp_totaux.montant_du, 0) - COALESCE(p_totaux.montant_payer, 0)) AS reste_a_payer
    FROM Commandes AS c
    LEFT JOIN (
        SELECT commandeId, SUM(montant) AS montant_payer
        FROM Paiements
        GROUP BY commandeId
    ) AS p_totaux ON p_totaux.commandeId = c.id
    LEFT JOIN (
        SELECT cp.commandeId, SUM(cp.quantite * pl.prix) AS montant_du
        FROM CommandePlats AS cp
        JOIN Plat AS pl ON cp.platId = pl.id
        GROUP BY cp.commandeId
    ) AS cp_totaux ON cp_totaux.commandeId = c.id
    WHERE COALESCE(cp_totaux.montant_du, 0) > COALESCE(p_totaux.montant_payer, 0);

-- Etape 7 --
    -- Insertion des prix figees --
    UPDATE CommandePlats SET prixUnitaire = (
        SELECT pl.prix FROM Plat as pl WHERE pl.id = platId
    );

    -- Changement du prix d'un plat --
    UPDATE Plat SET prix = 7500 WHERE id = 1;