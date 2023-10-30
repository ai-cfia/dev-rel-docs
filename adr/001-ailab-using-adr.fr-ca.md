# ADR-001 : Adoption des Registres de Décisions Architecturales

## Résumé Exécutif

Ce Registre de Décisions Architecturales (ADR) officialise l'utilisation des
ADR au sein du Laboratoire d'Intelligence Artificielle (AI-Lab) de l'Agence
Canadienne d'Inspection des Aliments (ACIA). Un ADR est conçu pour consigner
les décisions qui traversent plusieurs projets et produits, et qui sont
suffisamment significatives pour nécessiter une conformité uniforme de toutes
les équipes. Nous avons opté pour les ADR pour leur format clair, versionné et
accessible, permettant de résoudre des problèmes tels que les discussions
répétées, les approches incohérentes et les difficultés d'intégration. Ce
document établit les normes pour la création, le stockage et la modification
des ADR.

## Définitions

- Contrôle de version : Un système qui enregistre les modifications apportées
  à un fichier ou un ensemble de fichiers au fil du temps, comme GitHub.
- Dépôt : Un emplacement central où sont stockées et gérées les données
  contrôlées par version.
- Issue GitHub : Une section sur GitHub où sont suivis les problèmes, les
  améliorations, les tâches et d'autres types de questions.
- Pull Request GitHub : Une méthode pour soumettre des contributions à un
  projet de développement ouvert hébergé sur GitHub.
- Wiki : Une plateforme collaborative qui permet la modification de pages Web
  interconnectées, souvent utilisée pour la documentation.
- Demande de Commentaires (RFC) : Une méthode permettant des discussions
  collectives sur un problème ou une fonctionnalité proposée, souvent formalisée
  et contrôlée par version.
- Confluence : Un logiciel de collaboration développé par Atlassian, servant
  de wiki d'entreprise et d'outil de gestion de projet.
- Journal de Décisions : Une méthode simple d'archivage qui consigne les
  décisions clés prises au cours d'un projet, généralement sans contrôle de version.

## Contexte

L'AI-Lab, composé de développeurs de logiciels et de scientifiques de données,
est dédié à l'exploitation des technologies d'intelligence artificielle pour
relever divers défis, tant au sein de l'organisation que dans des engagements
externes. À mesure que l'équipe et ses projets se sont développés, des défis
ont surgi pour maintenir un historique clair et compréhensible des décisions
architecturales. Ces défis comprennent :

- Discussions répétées sur des décisions déjà prises : L'absence d'un processus
  formel de prise de décisions conduit souvent à revisiter les choix faits,
  entraînant une perte de temps et d'effort.
- Difficultés à intégrer de nouveaux membres dans l'équipe : L'absence d'une
  source unique et définitive pour les décisions architecturales complique le
  processus d'intégration.
- Approches architecturales incohérentes : Différents projets ou parties de
  projets adoptent parfois des approches variables, menant à des problèmes de
  maintenabilité à long terme.

## Décision

Après avoir évalué diverses options, nous avons choisi de mettre en place
des ADR pour maintenir un enregistrement versionné et facilement accessible
des décisions architecturales importantes. Chaque ADR détaillera le
raisonnement, le contexte et les conséquences de choix architecturaux
significatifs, mais pas des décisions triviales.

#### Exemples de décisions qui pourraient être abordées par un ADR

- Quel moteur de base de données devrions-nous utiliser et pourquoi ?
- Devrions-nous passer à une architecture de microservices ?
- Quelle stratégie d'authentification devrions-nous adopter ?
- Comment gérerons-nous la versionnage de l'API ?
- Quelle approche prendrons-nous pour la mise en cache ?
- Quel fournisseur de cloud devrions-nous utiliser ?
- Quelles solutions de journalisation et de surveillance seront adoptées ?
- Devrions-nous utiliser des conteneurs pour le déploiement et si oui,
  quel outil d'orchestration ?
- Quel courtier de messages utiliser pour les opérations asynchrones ?
- Quelle est notre stratégie pour la sauvegarde et la récupération des données ?

#### Exemples de décisions qui ne devraient pas être abordées par un ADR

- De quelle couleur devrait être le bouton de connexion ?
- Comment implémentons-nous une fonction spécifique dans le code ?
- Quelles sont les règles spécifiques du pare-feu ?
- Quelles bibliothèques spécifiques utiliser pour la manipulation de chaînes ?
- Quels composants d'interface utilisateur individuels utiliser ?
- Configuration des variables d'environnement pour le développement local.
- Limites de pagination pour les listes et les tableaux.
- Algorithme à utiliser pour une tâche spécifique, unique.

### Format

- Langue : Les ADR seront rédigés en anglais pour maintenir une cohérence et
  toucher un public élargi. Une version française sera fournie par la suite.
- Clarté : L'objectif est d'utiliser un langage clair et simple dans les ADR.
- Relecture : Chaque ADR sera relu pour détecter des erreurs linguistiques ou 
  grammaticales avant sa finalisation. Des outils comme Antidote peuvent être 
  utiles.
- Nom des fichiers : Le nommage suivra la convention XXX-étiquette.md, tel que 
  001-ailab-using-adr.md.
  - XXX : Un numéro à trois chiffres pour une liste numérique ordonnée.
  - Étiquette : Un descriptif de la décision.
- Versions en français : Les traductions françaises auront le même préfixe que 
  l'ADR original, suivi de '.fr-ca'. Par exemple, 001-ailab-using-adr.fr-ca.md.
- Annexes : Les diagrammes et autres documents annexes porteront le préfixe 
  de l'ADR original. Par exemple, 001-ailab-using-adr-template.md.
- Format du titre : Les titres commenceront par "ADR-XXX : ", suivi d'une 
  brève description. Les numéros doivent correspondre entre le nom du fichier 
  et le titre.
- Sections : Un ADR comprendra un résumé exécutif, le contexte, la décision, 
  les alternatives envisagées, les conséquences et les références. Voir le 
  [Modèle ADR](./001-ailab-using-adr-template.fr-ca.md) pour plus de détails.

### Statuts Implicites

- PROPOSÉ : ADR ou modifications proposées via des pull requests GitHub actives
  et placées dans le dossier adr/.
- ACCEPTÉ : ADR fusionnés dans la branche principale.
- REJETÉ : Pull requests GitHub qui ont été refusées ou issues GitHub ayant
  conduit à une décision de ne pas poursuivre.
- OBSOLÈTE : ADR déplacés dans le dossier adr/archives/, indiquant que la
  décision est caduque.
- REMPLACÉ : ADR remplacés par un nouveau et déplacés vers adr/archives/, en
  conservant leur étiquette originale mais avec un nouveau numéro.
- MODIFIÉ : Modifications mineures apportées à un ADR existant, en conservant
  son numéro et son étiquette d'origine.

### Stockage

- Les ADR et leurs pièces jointes seront stockés dans un répertoire dédié de
  ce [dépôt](https://github.com/ai-acia/dev-rel-docs), sous le dossier adr/.
- Les ADR obsolètes et remplacés ainsi que leurs pièces jointes seront déplacés
  vers adr/archives/.

### Responsabilités et Processus de Création et de Mise à Jour

- Propositions : N'importe quel membre de l'organisation GitHub ai-cfia peut 
  démarrer un nouvel ADR ou apporter des changements en utilisant les issues et 
  pull requests GitHub.
- Approbation : Avant de fusionner, il faut l'aval de tous les membres de
  l'organisation GitHub ai-cfia.
- Approbation du Manager : La dernière étape du processus d'approbation est une
  revue et une validation par le manager de l'équipe.
- Désaccords : Si de fortes objections se manifestent, le processus est en
  suspens jusqu'à ce qu'un accord soit trouvé.

#### Exemple : Remplacer un ADR

1. Commencez par créer une issue GitHub pour discuter de la nécessité de
   modifications majeures dans le ADR existant. Incluez toute l'équipe.
2. Une fois un accord trouvé, créez une nouvelle branche pour les changements.
   - Dans cette nouvelle branche, créez un nouveau ADR avec un nouveau numéro
     mais gardez l'étiquette originale. Ce nouveau ADR doit faire référence à
     l'ancien.
   - Mettez à jour l'ancien ADR pour faire référence au nouveau et préparez-le
     à être déplacé vers adr/archives/.
   - Mettez à jour l'[index](./index.md).
   - Soumettez ces changements sous forme de pull request depuis la nouvelle
     branche, en la liant à l'issue GitHub originale pour le contexte.
3. Une fois la pull request approuvée par toute l'équipe, fusionnez-la.

## Alternatives Étudiées

### ADR

Avantages :

- Offre un historique des décisions sous contrôle de version, correspondant
  bien aux besoins de traçabilité de l'équipe.
- Facilite le processus d'intégration rapide en offrant une seule source de
  vérité pour les décisions architecturales.
- Favorise la cohérence entre les projets en documentant les décisions et
  leurs justifications.

Inconvénients :

- Soulève le défi de veiller à ce que tous les membres de l'équipe contribuent
  activement et lisent les ADR.
- Le temps supplémentaire nécessaire pour rédiger, réviser et maintenir les
  ADR peut ralentir les phases initiales des projets.
- Nécessite une discipline continue pour maintenir et mettre à jour les
  enregistrements.

### Continuer avec une Documentation basée sur Wiki

Avantages :

- Rapide et simple à mettre à jour.
- Aucun outil supplémentaire requis.

Inconvénients :

- Manque de contrôle de version, entraînant une confusion potentielle.
- Risque de devenir obsolète.
- Inadéquat pour suivre l'historique des décisions.

### Demande de Commentaires (RFC)

Avantages :

- Facilite les discussions à l'échelle de l'équipe pour la prise de décisions.
- Formalise le processus de prise de décisions.

Inconvénients :

- Consomme beaucoup de temps pour la discussion et l'approbation.
- Le processus formel peut dissuader les contributions de membres moins
  expérimentés de l'équipe.

### Confluence

Avantages :

- Prend en charge le texte enrichi et les multimédias pour une documentation
  complète.
- S'intègre bien avec d'autres outils comme Jira.

Inconvénients :

- Coût supplémentaire pour les licences.
- La complexité peut entraîner un désordre.

### Journal de Décisions

Avantages :

- Solution simple et peu technologique.
- Facile à maintenir et à mettre à jour.
- Peut être intégré dans les outils de gestion de projet existants.

Inconvénients :

- Peut manquer de contexte et de justification détaillés derrière les
  décisions.
- Pas intrinsèquement sous contrôle de version.
- Risque de désorganisation si il est mal entretenu.

## Conséquences

- Toutes les décisions architecturales significatives seront documentées,
  facilitant la compréhension de l'historique et de l'état actuel du système.
- Les nouveaux membres de l'équipe pourront se mettre à niveau en examinant
  les ADR en fonction de leurs étiquettes de sujet et en consultant l'historique
  des versions pour le contexte.
- Les ADR serviront de point de référence pour les futures décisions
  architecturales, réduisant le besoin de discussions répétées.
- Ce ADR sera revu périodiquement pour évaluer ses résultats.

## Références

* [Architecture Decision Record (ADR). Joel Parker Henderson. (n.d.)](https://github.com/joelparkerhenderson/architecture-decision-record)
<a id="ref1"></a>

* [Record Architecture Decisions. Code With Engineering Playbook. (2020, March 20)](https://microsoft.github.io/code-with-engineering-playbook/design/design-reviews/decision-log/doc/adr/0001-record-architecture-decisions/)
<a id="ref2"></a>

* [Communicating and Documenting Architectural Decisions. David Ayers. (n.d.)](https://www.youtube.com/watch?v=rwfXkSjFhzc)
<a id="ref3"></a>

* [A Structured RFC Process. Phil Calçado. (2018, November 19)](https://philcalcado.com/2018/11/19/a_structured_rfc_process.html)
<a id="ref4"></a>

* [DACI: Decision Documentation. Atlassian Confluence. (n.d.)](https://www.atlassian.com/software/confluence/templates/decision)
<a id="ref5"></a>

* [How to Use a Project Decision Log for Optimal Results. Monday.com. (n.d.)](https://monday.com/blog/project-management/decision-log/)
<a id="ref6"></a>
