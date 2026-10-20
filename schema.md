### Schema (Etape 1)
* `Plat`(__id__,plat,categorie,prix):
  * Je choisis un Integer pour le prix
  * Je choisis id comme identifiant

### Schema (Etape 2)
* `Plat`(__id__,plat,prix,#categorieId)
* `Categorie`(__id__,libelle)
  * L'utilisation d'une colonne categorie TEXT serais compliquer sur le long terme dans le cas ou la valeur 'plat malagasy' serait different de 'plat gasy' or que c'est censer etre pareil

### Schema (Etape 3)
* `Plat`(__id__,plat,prix,#categorieId)
* `Commandes`(__id__,date)
* `CommandePlats`(__id__,#commandeId,#platId,quantite)
  * je place la quantite dans une table intermediaire commandePlats

### Schema (Etape 4)
* `Clients`(__id__,nom,prenom)
* `Commandes`(__id__,date,#clientId?)
  * Non, ma clee etrangere est NULLABLE
  * Pour ne perdre aucune commande il faudrait un LEFT JOIN

### Schema (Etape 5)
* `Serveurs`(__id__,nom,prenom)
* `Tables`(__id__,nom)
* `Commandes`(__id__,date,#clientId?,#serveurId?,#tableId?)
  * Une table de la salle peut avoir plusieurs commandes differentes or qu'une commande ne peut etre assigner qu'a une seule table
  * l'id de la table est censer etre ca reference or que son nom possede aussi un nombre

## Schema (Etape 6)
* `TypePaiements`(__id__,libelle)
* `Paiements`(__id__,#typeId,#commandeId,montant)
  * Parce qu'une commande peut etre payer avec plusieurs moyen