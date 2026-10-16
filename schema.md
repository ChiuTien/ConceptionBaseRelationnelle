### Schema (Etape 1)
* `Plat`(__id__,plat,categorie,prix):
  * Je choisis un Integer pour le prix
  * Je choisis id comme identifiant

### Schema (Etape 2)
* `Plat`(__id__,plat,prix,#categorieId)
* `Categorie`(__id__,libelle)
  * L'utilisation d'une colonne categorie TEXT serais compliquer sur le long terme dans le cas ou la valeur 'plat malagasy' serait different de 'plat gasy' or que c'est censer etre pareil