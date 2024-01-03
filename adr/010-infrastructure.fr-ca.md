# ADR-010 : Infrastructure

## Résumé Exécutif

Cette section fournit un bref résumé de la décision prise, en soulignant les
points principaux afin que le lecteur puisse comprendre l'essentiel sans avoir
à lire l'ensemble du document.

## Contexte

Notre équipe fait face à des défis en matière de déploiement de solutions, notamment dans le choix des fournisseurs de cloud. Historiquement, nous utilisions Google Cloud Run et Azure App Service. Cependant, en raison de l'absence de compte Google Cloud et des restrictions d'accès sur Azure, nous nous retrouvons à basculer d'un compte à l'autre, entraînant d'importants temps d'arrêt pour nos applications.

De plus, la création manuelle de tous les services sur les fournisseurs de cloud via le ClickOps s'est avérée fastidieuse. En ce qui concerne la sécurité, nous utilisons actuellement un Key Vault dans Azure pour récupérer manuellement les valeurs des variables d'environnement, mais cela ne constitue pas une solution optimale pour la gestion des secrets.

Le scalling de nos applications n'est pas actuellement une priorité, car nous avons une visibilité fixe sur le nombre d'utilisateurs. Cependant, nous n'avons pas encore mis en oeuvre de solution de scaling. 

En ce qui concerne le monitoring et la télémétrie, nous n'avons actuellement rien en place en dehors des outils fournis par les fournisseurs de cloud. Nous reconnaissons la nécessité d'améliorer ces aspects pour une gestion plus efficace de nos applications.

Bref, de nombreuses tâches sont actuellement effectuées manuellement. Bien que nous disposions de github workflow pour déployer des images Docker, la gestion des déploiements sur différents fournisseurs de cloud n'est pas automatisée. En cas d'erreur en production, aucune solution ne permet aux développeurs de résoudre rapidement le problème

Voici quelle que cas d'utilisations qui on été discuter qu'on voudrait gérer:

- Gérer la base de données PostgreSQL (et bientôt PostgreSQL ML) sans recourir au ClickOps ;

- Accroître la redondance des données de manière plus efficace ;

- Déployer, gérer, surveiller et instrumenter les applications au sein de l'organisation ;

- Améliorer la gestion des secrets ;

- Éliminer les silos entre l'équipe de sécurité et l'équipe DevOps au sein de l'organisation ;

- Mettre en place des déploiements sur tous les fournisseurs de cloud en cas de pannes. Cela inclue une persistances des données dans les différents cloud provider ;

- Automatisation du scalling (HPA) ;

- Adopter une stratégie de sauvegarde et de reprise après sinistre ; 

- Créer une documentation facile de lecture et d'adaption pour permettre une transition "shift-left" ;

- Éviter les points de défaillance uniques.

## Décision

**DRAFT**

Notre solution consistera à déployer des clusters Kubernetes sur différents fournisseurs de cloud. Voici les composants qui seront déployés pour gérer divers cas d'utilisation

- Gestion des secrets: HashiCorp Vault. Cependant, nous prévoyons d'explorer d'autres solutions avant de nous engager pleinement avec Vault  ;

- Gestion des deployments: ArgoCD et Kustomize (nous envisageons également Flux) ;

- Gestion des environnements de developpement: vcluster ;

- Gestion des VM's (au besoins): KubeVirt ;

- Gestion de l'instrumentation des applications: OpenTelemetry et Clickhouse ;

- Gestion du monitoring: Grafana et Prometheus pour collecter des métriques spécifiques aux applications déployées avec Helm ;

- Gestion du load balancing: Ingress NGINX ;

D'autres composants seront ajoutés au besoin.

## Alternatives Considérées

Cette section présente les différentes options ou solutions considérées avant
d'arriver à la décision finale. Chaque alternative est généralement discutée
dans une sous-section.

### Alternative 1

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

### Alternative 2

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

Ajoutez autant d'alternatives que nécessaire.

## Conséquences

Cette partie décrit les résultats attendus, positifs comme négatifs, de la
décision. Cela peut inclure son impact sur différentes parties prenantes ou
toute action qui doit être prise à la suite de la décision.

## Références

Toute documentation, recherche ou données soutenant la décision peuvent être
citées ici. Cela peut inclure des articles académiques, des articles de blog ou
des documents internes.
