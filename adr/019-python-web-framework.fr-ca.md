# ADR-19 : Framework Web Python

## Illustration Optionnelle

| Fonctionnalité/Aspect         | Flask                                           | FastAPI                                           | Quart                                            |
|------------------------------|-------------------------------------------------|--------------------------------------------------|-------------------------------------------------|
| **Type**                     | Synchrone, basé sur WSGI                        | Asynchrone, basé sur ASGI                        | Asynchrone, basé sur ASGI                        |
| **Performance**              | Modérée, difficultés sous haute concurrence     | Haute performance, asynchrone par défaut         | Bonne performance, entièrement asynchrone        |
| **Support Asynchrone**       | Pas de support natif, nécessite des extensions  | Support asynchrone intégré                       | Entièrement asynchrone                           |
| **Support Swagger/OpenAPI**  | Nécessite des extensions tierces (Flask-Swagger)| Génération automatique de la doc OpenAPI/Swagger | Nécessite des bibliothèques supplémentaires (Quart-Swagger, Flasgger) |
| **Expérience Développeur**    | Facile à utiliser, mais nécessite des configurations manuelles | Excellente, validation de types intégrée & support asynchrone | Similaire à Flask, pas de Swagger intégré  |
| **Écosystème**               | Large et mature                                 | Croissant, mais moins d'extensions que Flask     | Écosystème similaire à Flask                    |
| **Support WebSockets/HTTP2** | Pas de support natif                            | WebSockets via Starlette, mais non intégré       | Support natif des WebSockets et HTTP/2           |
| **Courbe d'Apprentissage**   | Facile à apprendre pour les débutants           | Modérée, nécessite une compréhension des annotations de types | Facile pour les utilisateurs de Flask, mais l'asynchrone ajoute de la complexité |
| **Meilleur Cas d'Utilisation** | Petites à moyennes applications                | APIs asynchrones à haute performance, microservices | Applications en temps réel, APIs de type Flask avec de l'asynchrone |

## Résumé Exécutif

Cette ADR évalue et sélectionne un framework web Python pour le projet
fertiscan-backend. Après avoir considéré plusieurs options, dont Flask, FastAPI
et Quart, la décision a été prise d'adopter FastAPI. Ce choix est motivé par le
support asynchrone intégré de FastAPI, la génération automatique de
documentation OpenAPI/Swagger, et sa haute performance sous forte concurrence.
Bien que Flask et Quart offrent leurs propres avantages, les fonctionnalités
modernes et l'expérience développeur conviviale de FastAPI en font le framework
le plus approprié pour nos besoins.

## Contexte

Actuellement, nous utilisons Flask pour construire nos APIs. Bien que Flask ait
été suffisant, il est synchrone et manque de certaines fonctionnalités modernes
comme le support asynchrone intégré et la génération automatique de
documentation API (OpenAPI/Swagger). Il existe d'autres frameworks open-source
qui pourraient mieux répondre à nos besoins en offrant une meilleure expérience
développeur et un ensemble de fonctionnalités amélioré. Nous envisageons des
alternatives comme FastAPI, Quart, et d'autres répondant à nos critères, mais
seules les solutions open-source seront considérées.

## Décision

Cette section indique clairement la décision qui a été prise, et peut aussi
inclure des justifications et des arguments.

La décision a été prise d'adopter FastAPI. Ce choix est motivé par le support
asynchrone intégré de FastAPI, la génération automatique de documentation
OpenAPI/Swagger, et sa haute performance sous forte concurrence. Bien que Flask
et Quart offrent leurs propres avantages, les fonctionnalités modernes de
FastAPI, telles que la validation des types et l'injection de dépendances, ainsi
que son excellente expérience développeur, en font le framework le plus
approprié pour nos besoins.

## Alternatives Considérées

Voici une liste des avantages et inconvénients de chaque framework en fonction
de votre contexte :

### **Flask**

**Avantages :**

1. **Léger** : Framework minimaliste avec peu de surcharge, facile à démarrer et
   très flexible.
2. **Écosystème Riche** : Mûr et bien documenté avec de nombreuses extensions
   (e.g., Flask-RESTful, Flask-SQLAlchemy, etc.) pour étendre ses
   fonctionnalités.
3. **Facile à Apprendre** : Idéal pour les petits projets et les prototypes
   rapides; bien adapté aux débutants.
4. **Grande Communauté** : En tant que l'un des frameworks Python les plus
   populaires, Flask a une grande communauté et beaucoup de ressources d'aide.
5. **Personnalisable** : Vous avez un contrôle total sur l'architecture et
   pouvez choisir les outils dont vous avez besoin.

**Inconvénients :**

1. **Synchrone par Défaut** : La nature synchrone de Flask le rend moins adapté
   aux charges de travail hautement concurrentes ou aux applications en temps
   réel.
2. **Pas de Support Asynchrone Natif** : Nécessite un effort supplémentaire et
   des bibliothèques (e.g., `aiohttp`) pour gérer les tâches asynchrones, ce qui
   peut compliquer le développement.
3. **Manque de Fonctionnalités Intégrées** : Les fonctionnalités comme
   l'authentification, la validation et la documentation API automatique
   nécessitent des extensions tierces.
4. **Documentation API Manuelle** : Nécessite des bibliothèques externes (e.g.,
   Flask-Swagger, Flask-RESTPlus) pour générer la documentation OpenAPI, ce qui
   ajoute de la surcharge pour les développeurs.
5. **Limité pour les Grandes Applications** : Faire évoluer Flask pour des APIs
   ou services de grande taille, hautement concurrents, nécessite plus d'efforts
   que les frameworks asynchrones modernes.

### **FastAPI**

**Avantages :**

1. **Asynchrone par Défaut** : Construit sur Starlette et Pydantic, il supporte
   la programmation asynchrone nativement, offrant de meilleures performances
   sous forte concurrence.
2. **Swagger/OpenAPI Automatique** : Génère automatiquement la documentation
   OpenAPI et Swagger interactive sans configuration, ce qui fait gagner du
   temps et des efforts.
3. **Haute Performance** : L'un des frameworks web Python les plus rapides,
   conçu pour la performance et l'évolutivité.
4. **Fonctionnalités Modernes de Python** : Les annotations de type et la
   validation des données sont intégrées dans le framework, ce qui conduit à un
   code plus propre et plus robuste.
5. **Convient aux Développeurs** : Offre une excellente expérience développeur
   avec des fonctionnalités telles que la validation automatique, l'injection de
   dépendances, l'intégration de Pydantic et des tests faciles.
6. **Transition Facile vers l'Asynchrone** : Vous pouvez facilement mélanger des
   routes synchrones et asynchrones, offrant une grande flexibilité.

**Inconvénients :**

1. **Courbe d'Apprentissage** : Bien que FastAPI soit convivial pour les
   développeurs, les débutants pourraient trouver la dépendance aux annotations
   de type et à l'asynchrone un peu difficile.
2. **Écosystème Plus Petit** : Bien qu'en croissance, l'écosystème de FastAPI
   n'est pas aussi large ou mature que celui de Flask. Il existe moins
   d'extensions et de bibliothèques tierces par rapport à Flask.
3. **Moins Mature** : En tant que framework plus récent, il peut ne pas être
   aussi éprouvé que Flask.
4. **Paradigme Différent** : Notre équipe utilise actuellement soit Flask, soit
   Quart, qui partagent tous deux une API et une approche de développement
   similaires. FastAPI introduit un paradigme et une API différents, ce qui
   obligerait notre équipe à soit s'y adapter entièrement, soit supporter
   plusieurs frameworks, aucun de ces choix n'étant idéal.

### **Quart**

**Avantages :**

1. **Support Asynchrone** : Framework entièrement orienté asynchrone, conçu pour
   gérer plus efficacement les requêtes concurrentes que Flask.
2. **Familiarité pour les Utilisateurs de Flask** : Quart conserve une API
   similaire à Flask, ce qui facilite la transition pour les développeurs
   habitués à Flask sans nécessiter beaucoup d'apprentissage. Quart est déjà
   utilisé dans Nachet, donc notre équipe y est déjà familière.
3. **Écosystème Riche** : Un écosystème similaire à Flask. Les deux sont
   développés par la même équipe.
4. **Support WebSocket et HTTP/2** : Support natif des WebSockets et de HTTP/2,
   en faisant une bonne option pour les applications en temps réel.
5. **Flexible** : Comme Flask, Quart est très personnalisable et peut être
   adapté aux besoins exacts du projet.

**Inconvénients :**

1. **Pas de Support Swagger Intégré** : Contrairement à FastAPI, Quart ne
   fournit pas de documentation API automatique, nécessitant des

 bibliothèques supplémentaires ou une configuration manuelle.
2. **Performance** : Bien que Quart soit asynchrone par défaut, il est
   généralement considéré comme légèrement plus lent que FastAPI dans les cas
   d'utilisation à haute concurrence.
3. **Flux d'Authentification Différent** : La bibliothèque d'authentification la
   plus [bien
   maintenue](https://quart-auth.readthedocs.io/en/latest/tutorials/quickstart.html)
   pour Quart diffère du [flux d'authentification actuel de
   Flask](https://pypi.org/project/Flask-HTTPAuth/), nécessitant des changements
   côté frontend. Bien que des alternatives existent, elles ne sont pas aussi
   bien maintenues et peuvent ne pas être viables à long terme.

## Conséquences

### Résultats Positifs

1. **Performance Améliorée** : L'adoption de FastAPI améliorera la performance
   de notre backend, surtout sous forte concurrence, grâce à sa nature
   asynchrone.
2. **Documentation API Automatique** : Le support intégré de FastAPI pour
   OpenAPI/Swagger simplifiera le processus de génération et de maintien de la
   documentation API.
3. **Expérience Développeur** : Les fonctionnalités conviviales pour les
   développeurs de FastAPI augmenteront probablement la productivité et
   réduiront la courbe d'apprentissage pour les nouveaux membres de l'équipe.

### Résultats Négatifs

1. **Courbe d'Apprentissage** : La transition vers FastAPI pourrait nécessiter
   une période d'apprentissage pour l'équipe, notamment pour ceux qui ne sont
   pas familiers avec la programmation asynchrone et les annotations de type.
2. **Effort de Refactoring** : Le code basé sur Flask existant devra être
   refactorisé pour s'adapter au framework FastAPI, ce qui peut nécessiter un
   temps et des ressources de développement importants.
3. **Gestion des Dépendances** : Le passage à FastAPI pourrait nécessiter des
   changements dans les dépendances et bibliothèques qui ne sont pas compatibles
   avec notre configuration actuelle.

## Références

- <https://fastapi.tiangolo.com/>
- <https://flask.palletsprojects.com/en/3.0.x/>
- <https://quart.palletsprojects.com/en/latest/>
- <http://blog.pamelafox.org/2024/07/should-you-use-quart-or-fastapi-for-ai.html>
