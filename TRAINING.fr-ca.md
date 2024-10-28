# Suivi de la progression

* Créer une pull request pour ce fichier de formation
  * Proposer des ressources alternatives supplémentaires (meilleures)
  * Suivre le temps de réalisation pour chaque élément
  * Ouvrir une [issue](https://github.com/ai-cfia/dev-rel-docs/issues)
    1. Nommer l'issue "Processus d'intégration de *votre nom*"
    1. Utiliser ce modèle :

    1. ```markdown
        Processus d'intégration de *Votre Nom*

        Tâches :

        * [ ] Mettre à jour les descriptions de temps.
        * [ ] Autre tâche que vous souhaitez ajouter.

        Critères d'acceptation :

        La formation devrait équiper la·e développeur·euse des compétences nécessaires pour
        travailler dans le cadre du Labo d'IA.
        La formation devrait fournir des estimations de temps précises pour chaque module.
        ```

    1. Cliquer sur le bouton d'édition de training.md
    1. Modifier le document (exemple : ajouter le temps que vous avez pris pour
      lire les valeurs et l'éthique)
    1. Valider (commit) les changements
    1. Créer une branche avec ce format :
      numéro_du_problème-processus-d'intégration-votre-nom (exemple :
      42-processus-d'intégration-happy-gilmor)
    1. Cliquer sur *Propose Change*
    1. Sur la page **Open a Pull Request** :
        * Ajouter un titre
        * Sélectionner *draft pull request* au lieu de *create a pull request*

* [Microsoft Learn](https://learn.microsoft.com/):
  * Du bon matériel de formation sur Microsoft Learn que nous utilisons
  * Connectez-vous à Microsoft Learn, créez un compte et suivez l'XP pour
    mesurer les progrès

## Pour tout le monde : Formation commune

* [Code des valeurs et de l'éthique du secteur
  public](https://www.tbs-sct.canada.ca/pol/doc-fra.aspx?id=25049) (~15 minutes)
* [Normes numériques du gouvernement du
  Canada](https://www.canada.ca/fr/gouvernement/systeme/gouvernement-numerique/normes-numeriques-gouvernement-canada.html)
  (~30 minutes)
* Examiner le code source ouvert sur notre Github
  [https://github.com/ai-cfia](https://github.com/ai-cfia)
  * Porter une attention particulière aux [ADR (Architecture Decision Records) -
    under
    development](https://github.com/ai-cfia/dev-rel-docs/blob/main/adr/index.md)
* Linux
  * [Ligne de commande Linux et le
    Shell](https://learn.microsoft.com/fr-fr/training/paths/shell/) (~25
    minutes)
  * [Aide-mémoire programmation Bash](https://devhints.io/bash) (~45 minutes)
  * [Guide de style Shell
    Google](https://google.github.io/styleguide/shellguide.html) (~25 minutes)
* Utilisation de Markdown
  * [Guidance Markdown Azure
    DevOps](https://learn.microsoft.com/fr-fr/azure/devops/project/wiki/markdown-guidance?view=azure-devops)
    (~10 minutes)
* Github
  * NE PAS INSTALLER GITHUB DESKTOP (nous utilisons les fonctionnalités
    intégrées dans Visual Studio Code)
  * [Meilleures pratiques pour les
    projets](https://docs.github.com/fr/issues/planning-and-tracking-with-projects/learning-about-projects/best-practices-for-projects)
    (~5 minutes)
  * [À propos des
    issues](https://docs.github.com/fr/issues/tracking-your-work-with-issues/about-issues)
    (~5 minutes)
  * [À propos des révisions de pull
    requests](https://docs.github.com/fr/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews)
    (~5 minutes)
  * [Création d'un dépôt
    Github](https://github.com/ai-cfia/devops/blob/main/github-repository-creation-guide.md)
    (~5 minutes)
* Docker
  * NE PAS INSTALLER DOCKER DESKTOP (nous utilisons l'installation de Docker en
    ligne de commande)
  * [Introduction aux conteneurs
    docker](https://learn.microsoft.com/fr-fr/training/modules/intro-to-docker-containers/)
    (~30 minutes)
  * [Sécurité des
    conteneurs](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html)
    (~10 minutes)
* [L'application Twelve-Factor](https://12factor.net/fr/) (~45 minutes)
* [Le test de Joel : 12 étapes pour un meilleur
  code](https://www.joelonsoftware.com/2000/08/09/the-joel-test-12-steps-to-better-code/)
  (~30 minutes)
* [Tests unitaires Python](https://docs.python.org/fr/3/library/unittest.html)
  (~1 heure)

## Formations spécifiques au rôle

* Base de données
  * [Exercices PostgreSQL](https://pgexercises.com/) (~14 heures)
  * [Documentation PostgreSQL](https://www.postgresql.org/docs/)
  * [Azure Database pour
    PostgreSQL](https://learn.microsoft.com/fr-fr/training/paths/introduction-to-azure-postgres/)
    (~40 minutes)
  * [Transactions avec
    Psycopg3](https://www.psycopg.org/psycopg3/docs/basic/transactions.html)
* DevSecOps
  * [Qu'est-ce que DevOps ?](https://resources.github.com/devops/) (~25 minutes)
  * [DevOps
    sécurisé](https://learn.microsoft.com/fr-fr/training/modules/introduction-to-secure-devops/)
    (~10 minutes)
  * [Github Actions](https://docs.github.com/fr/actions) (~1 heure)
  * [Documentation de l'interface de ligne de commande Azure
    (CLI)](https://learn.microsoft.com/fr-ca/cli/azure/) (~20 minutes)
  * [Ingénieur
    DevOps](https://learn.microsoft.com/fr-fr/certifications/devops-engineer/)
    (~5 minutes)
  * [Guidelines
    DevSecOps](https://owasp.org/www-project-devsecops-guideline/latest/00a-Overview)
    (~30 minutes)
  * [30 jours de directives pour le
    Cloud](https://github.com/canada-ca/cloud-guardrails) (~20 minutes)
  * [Orientation sur l'évaluation et l'autorisation de sécurité du
    cloud](https://www.cyber.gc.ca/fr/orientation/guide-sur-levaluation-et-lautorisation-de-la-securite-infonuagique-itsp50105)
    (~30 minutes)
  * [L'art des SLOs (Objectifs de niveau de
    service)](https://docs.google.com/document/d/11qMVVdn95tyGvYiVA5HwjlIV750-gYiT-dJCNS0ZPE0/edit)
    (~10 minutes)
  * [Gestion des risques de sécurité informatique du GC
    ITSG-33](https://www.cyber.gc.ca/fr/orientation/la-gestion-des-risques-lies-la-securite-des-ti-une-methode-axee-sur-le-cycle-de-vie)
    (~15 min)
* Backend
  * [Créer une application Web IA en utilisant Python et
    Flask](https://learn.microsoft.com/fr-fr/training/modules/python-flask-build-ai-web-app/)
    (~45 minutes)
  * [Débuter avec Psycopg
    3](https://www.psycopg.org/psycopg3/docs/basic/index.html) (~50 minutes)
  * [Programmation fonctionnelle
    Python](https://docs.python.org/fr/3/howto/functional.html) (~35 minutes)
  * [Anti-modèles
    Python](https://docs.quantifiedcode.com/python-anti-patterns/index.html) (~1
    h 30)
  * [Didacticiels PostgreML](https://postgresml.org)
  * [Gestion des exceptions en
    Python](training/python/handling-exception-training.md)
* Frontend
  * [Create React App est officiellement
    mort](https://dev.to/ag2byte/create-react-app-is-officially-dead-h7o)
  * [Versionnage des
    applications](https://github.com/ai-cfia/dev-rel-docs/blob/main/TypeScript-AppVersion/APPVERSION-SETUP.md)
  * [Application React
    TypeScript](https://github.com/ai-cfia/dev-rel-docs/blob/main/TypeScript-React-Setup-Guide/REACTSETUP.md)

## Spécifique au produit

* Nachet
  * [Introduction à l'Azure Blob
    Store](https://learn.microsoft.com/fr-fr/azure/storage/blobs/storage-blobs-introduction)
  * [Utiliser Azure Storage Explorer pour créer un
    blob](https://learn.microsoft.com/fr-fr/azure/storage/blobs/quickstart-storage-explorer)

* Finesse
  * [Créer un index de recherche dans le portail
    Azure](https://learn.microsoft.com/fr-fr/azure/search/search-get-started-portal)

## Ressources supplémentaires

* [Playlist Youtube AI
  CFIA](https://www.youtube.com/playlist?list=PLMZysQw4y3kJ5AHdZlUswFvGPNdZaXRXP&jct=bOudgv2_gRwU7RfA10XBbCFkv7vAhQ)
* [Ingénieur IA
  Azure](https://learn.microsoft.com/fr-fr/certifications/azure-ai-engineer/)
* Orientation pour l'inspection
  * [Processus d'inspection
    standard](https://inspection.canada.ca/inspection-et-application-de-la-loi/orientations-pour-les-activites-d-inspection/prelevement-d-echantillons/processus-d-inspection-standard/fra/1545435489013/1545435489265)
