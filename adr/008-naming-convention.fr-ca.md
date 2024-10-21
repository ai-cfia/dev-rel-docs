# ADR-008 : Conventions de nommage pour le Laboratoire d'IA

## Résumé

La décision d'établir une convention de nommage pour l'intelligence artificielle
(IA) du laboratoire de l'Agence canadienne d'inspection des aliments (ACIA) vise
à apporter clarté et cohérence à la structure interne du laboratoire. La
convention couvre les composants, applications logicielles, équipements
matériels, ensembles de données, projets de recherche, environnements et
conteneurs. En adoptant cette approche standardisée, le Laboratoire d'IA entend
améliorer la communication, la documentation et l'organisation globale,
facilitant une collaboration sans faille entre les chercheur·euse·s,
développeur·euse·s et parties prenantes. Cette décision est conforme à
l'engagement du laboratoire envers des pratiques efficaces et structurées dans
le domaine de l'IA appliquée.

## Contexte

L'établissement d'une convention de nommage pour le Laboratoire d'IA est motivé
par l'impératif d'introduire une cohérence et une uniformité dans le cadre
organisationnel interne du laboratoire. Cette initiative est entreprise pour
favoriser la clarté et l'efficacité dans la communication, la documentation et
la structuration globale des ressources au sein du Laboratoire d'IA. Le contexte
prépare le terrain pour la nécessité de rationaliser la nomenclature, facilitant
une collaboration sans heurts entre les chercheur·euse·s et les
développeur·euse·s.

## Décision

### Dépôts GitHub

- **Convention** : Utiliser des minuscules et séparer les mots avec des tirets.
- **Exemple** : `my-repo-name`
- **Référence** :
  - [Tilburg. Best Practices for Naming Git Branches.](#tilburg)
  - [Branching. Digitaljhelms.](#digitaljhelms)

### Fichiers

- **Convention** : Utiliser des minuscules et séparer les mots avec des tirets.
- **Exemple** : `my-file.sh`

### Dossiers/répertoires

- **Convention** : Utiliser des minuscules et séparer les mots avec des tirets.
- **Exemple** : `my-folder`

### Variables d'environnement

- **Convention** : Commencer par le nom du dépôt en majuscules, suivi du nom
  réel de la variable, en séparant les mots par des underscores.
- **Exemple** : `PROJECT_NAME_MY_ENV_VAR`
- **Exception** : Dans un projet React, les variables d'environnement doivent
  être préfixées par `REACT_APP`, donc dans ce cas nous avons besoin de ce
  préfixe.
- **Exemple** : `REACT_APP_PROJECT_NAME_ENV_VAR`

### Nom du projet

- **Pratique standard** : Notre approche habituelle consiste à sélectionner une
  figure bien connue associée au thème du projet.

### Groupes de ressources Azure

- **Convention** : Terminer par `-rg` suivi du nom en minuscules, en séparant
  les mots par des tirets. `-rg` signifie `resource group` (groupe de
  ressources).
- **Exemple** : `resource-group-rg` **Référence** :
  - [Microsoft. Azure Naming Best Practices](#microsoft-1)
  - [Microsoft. Azure Resource Abbreviations](#microsoft-2)

### Ressources Azure

- **Convention** : Utiliser des minuscules et séparer les mots par des tirets.
  Inclure le nom du projet et le type de ressource.
- **Exemple** : `$(PROJECT_NAME)-storage-account`. Donc pour
  `PROJECT_NAME=nachet`, utilisez `nachet-storage-account`.

### Fichiers SQL

- **Convention** : Utiliser un préfixe avec le format de date aaaa-mm-jj suivi
  d'une description du script.
- **Exemple** : `2023-09-24-description-of-script.sql`

### Serveur / Cluster de bases de données

- **Convention** : Le nom doit suivre ce modèle : `projet-service-environnement`
  tout en minuscules, en séparant les mots avec des tirets.
- **Exemple** : `nachet-postgresql-dev`
- **Exemple** : `finesse-postgresql-prd`

### Base de données

- **Convention** : Utiliser en minuscules, ne pas utiliser d'espace.
- **Exemple** : `databasefullname`

### Schéma de base de données

- **Convention** : Commencer par `name_` où name est le nom du schéma, suivi des
  numéros de version actuels.
- **Exemple** : `name_1.0.0`
- **Pourquoi** : Nous adoptons ce format pour nous conformer à la norme
  `semver`, nous permettant d'utiliser des outils dans différentes langues pour
  analyser les versions efficacement. Pour plus d'informations, vous pouvez
  consulter l'ADR-006 sur la façon dont nous gérons les changements dans les
  bases de données.
- **Référence** :
  - [Semver.org, Semantic Versioning 2.0.0](#semver)
  - [Pypi.org, semver](#pypi)
  - [CFIA, ADR-006](#adr-006)
  - [Ovid. Database Naming Standards](#ovid)
  - [Rootsoft. Database Naming Convention](#rootsoft)
  - [Vertabelo. Worst Database Naming Conventions](#vertabelo)

### Table, Colonne et Vue de base de données

- **Convention** : Utiliser des minuscules et séparer les mots par des
  underscores. Pour le nommage, utiliser le pluriel.
- **Pourquoi** : Les mots réservés SQL sont au singulier, donc en utilisant le
  pluriel, vous êtes moins susceptible d'avoir une collision.
- **Exemple** : `my_table_name`,`my_column_name` `my_view_name`
- **Exemple concret** : `html_contents`, `users`, `user_id`

### Abréviation pour l'environnement

- `dev` : environnement de développement (branches de développement en cours
  généralement déployées pour les tests des développeur·euse·s)
- `uat` : test d'acceptation utilisateur : nouvelle version partagée avec la
  gestion de produit et les utilisateurs champions pour les tests avant le
  déploiement en production
- `prd` : production : version de production du système

## Notes

- Ces conventions de nommage doivent être suivies pour toutes les nouvelles
  ressources accessibles ou manipulables via la CLI.
- Les ressources existantes qui ne respectent pas ces conventions doivent être
  refactorisées pour y correspondre.
- Assurez-vous que les noms choisis correspondent à l'objectif ou à
  l'utilisation prévue de la ressource.

## Alternatives envisagées

Cette section présente les différentes options ou solutions envisagées avant
d'arriver à la décision finale.

### Alternative pour nommer la base de données

- **Alternative** : Ajout de `-db` pour spécifier le type du texte.
- **Exemple** : `databasefullname-db`

Avantages :

- Indique clairement qu'il s'agit d'une base de données, fournissant une
  identification sans ambiguïté même en l'absence de contexte.

Inconvénients :

- Dans l'usage courant, la nature en tant que base de données est déjà évidente,
  rendant la spécification supplémentaire inutile.

### Alternative pour nommer la Table et la Vue

- **Alternative** : Utilisation du tiret "`-`" au lieu de l'underscore "`_`"
  pour écrire le nom de la table.
- **Exemple** : `my-table-name`

Avantages :

- L'utilisation de tirets améliore souvent la lisibilité, en particulier dans
  des situations où les noms de tables peuvent être composés de plusieurs mots.
- Nous utilisons des tirets pour d'autres conventions de nommage, l'adoption
  d'une approche uniforme contribue à la cohérence globale.

Inconvénients :

- Certains systèmes ou langages de programmation ont des restrictions sur
  l'utilisation de tirets dans les identifiants, ce qui peut causer des
  problèmes de compatibilité.
- Dans les environnements où la convention est généralement d'utiliser des
  underscores, l'adoption de tirets peut entraîner de la confusion ou de
  l'incohérence si elle n'est pas appliquée uniformément.

## Conséquences

Cette convention de nommage aidera à créer une structure standardisée et
organisée au sein du Laboratoire d'IA, facilitant la compréhension et le travail
avec les différents composants et ressources pour les chercheur·euse·s,
développeur·euse·s et autres. Elle favorise la cohérence et la clarté dans la
communication et la documentation.

## Références

### Adr 006

Comment nous gérons les changements dans les bases de données. (2023, 6
novembre). CFIA AI-Lab.
[github.com/ai-cfia/dev-rel-docs/](https://github.com/ai-cfia/dev-rel-docs/blob/main/adr/006-database-change-management.md)

### Ovid

Standards de nommage de bases de données. (2022, 21 mars). Ovid.
[https://dev.to/ovid/database-naming-standards](
https://dev.to/ovid/database-naming-standards-2061)

### Rootsoft

Convention de nommage des bases de données. (2017, 15 juin). RootSoft.
[https://github.com/RootSoft/Database-Naming-Convention](
https://github.com/RootSoft/Database-Naming-Convention)

### Vertabelo

Les pires conventions de nommage des bases de données. (2021, 31 août).
Vertabelo. [https://vertabelo.com/blog/database-naming-convention](
https://vertabelo.com/blog/database-naming-convention)

### Tilburg

Meilleures pratiques pour nommer les branches Git. (s.d.). Tilburg Science Hub.
[https://tilburgsciencehub.com/](
https://tilburgsciencehub.com/topics/automation/version-control/advanced-git/naming-git-branches/)

### Digitaljhelms

Branchement. (s.d.). Digitaljhelms.
[https://gist.github.com/digitaljhelms/4287848](
https://gist.github.com/digitaljhelms/4287848)

### Microsoft-1

Meilleures Pratiques de nommage Azure. (2023, 13 décembre). Microsoft.
[https://learn.microsoft.com/fr-fr/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming](
https://learn.microsoft.com/fr-fr/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)

### Microsoft-2

Abréviations des ressources Azure. (2024, 26 avril). Microsoft.
[https://learn.microsoft.com/fr-fr/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations](
https://learn.microsoft.com/fr-fr/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)

### Semver

Versionnement sémantique 2.0.0 (s.d.). Semver.org.
[https://semver.org/](https://semver.org/)

### Pypi

Semver 3.0.2 (2023, 9 octobre). Pypi.org.
[https://pypi.org/project/semver/](https://pypi.org/project/semver/)
