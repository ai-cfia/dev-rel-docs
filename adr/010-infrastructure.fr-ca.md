# ADR-010 : Infrastructure

## Résumé Exécutif

todo

## Contexte

Notre équipe fait face à des défis en matière de déploiement de solutions,
notamment dans le choix des fournisseurs d'infonuages. Initialement, nous
utilisions [Google Cloud Run](https://cloud.google.com/run/?hl=en) et [Azure App
Service](https://azure.microsoft.com/en-ca/products/app-service/). Cependant, en
raison de l'absence de compte Google Cloud et des restrictions d'accès sur
Azure, nous nous retrouvons à basculer d'un compte à l'autre, entraînant
d'importants temps d'arrêt pour nos applications.

De plus, la création manuelle de tous les services sur les fournisseurs de cloud
via le ClickOps s'est avérée fastidieuse. Pour surmonter ce défi, , nous avons
décidé d'adopter l'Infrastructure as Code (IaC) en utilisant Terraform. Cette
approche nous permet de gérer et de provisionner nos infrastructures cloud via
des fichiers de configuration codifiés, éliminant ainsi le besoin de ClickOps et
réduisant significativement les erreurs humaines.

En ce qui concerne la sécurité, nous avions initialement adopté [Azure Key
Vault](https://azure.microsoft.com/en-us/products/key-vault/)  pour la
récupération manuelle des valeurs des variables d'environnement. Cependant,
reconnaissant la nécessité d'une solution plus robuste et polyvalente pour la
gestion des secrets, nous avons évolué vers le maintien d'une instance de
HashiCorp Vault. Cette transition permet une gestion centralisée des secrets et
des identifiants à travers différents environnements et plateformes.

La mise à l'echelle de nos applications n'est pas actuellement une priorité, car
nous avons une visibilité fixe sur le nombre d'utilisateurs. Cependant, nous
n'avons pas encore mis en oeuvre de solution de mise à l'échelle.

Actuellement, pour le monitoring et la télémétrie, nous nous appuyons
exclusivement sur les outils intégrés des fournisseurs de cloud, comme ceux de
Google Cloud Run. Cependant, il est important de considérer la flexibilité et la
portabilité que peuvent offrir des services externes tels
qu'[OpenTelemetry](https://opentelemetry.io/). Ces solutions peuvent non
seulement s'adapter à divers environnements de cloud mais aussi offrir une
personnalisation poussée qui répond spécifiquement à nos besoins. Bien que les
solutions maison puissent sembler exigeantes en termes de maintenance, elles
nous permettent d'optimiser notre surveillance et notre télémétrie de manière
ciblée, offrant ainsi un potentiel d'alignement plus précis avec nos objectifs
opérationnels.

Bref, de nombreuses tâches sont actuellement effectuées manuellement. Bien que
nous disposions de Github Workflow pour déployer des images Docker, la gestion
des déploiements sur différents fournisseurs d'infonuages n'est pas automatisée.
En cas d'erreur en production, aucune solution ne permet aux développeurs de
résoudre rapidement le problème

## Cas d'utilisation

- Gérer la base de données PostgreSQL (et bientôt PostgreSQL ML) sans recourir
  au ClickOps.
- Accroître la redondance des données de manière plus efficace.
- Déployer, gérer, surveiller et instrumenter les applications au sein de
  l'organisation.
- Améliorer la gestion des secrets.
- Éliminer les silos entre l'équipe de sécurité et l'équipe DevOps au sein de
  l'organisation
- Mettre en place des déploiements sur tous les fournisseurs de cloud en cas de
  pannes. Cela inclue une persistences des données dans les différents
  fournisseurs d'infonuages.
- Gérer une solution SSO centralisé pour authentifier les utilisateurs des
  services hébergés.
- Utiliser l'Infrastructure as Code pour automatiser la création, le
  déploiement, et la gestion de l'infrastructure permettant la rapidité des
  opérations d'infrastructure tout en réduisant les erreurs manuelles.
- Automatisation de la mise à l'échelle (HPA).
- Adopter une stratégie de sauvegarde et de reprise après sinistre.
- Créer une documentation facile de lecture et d'adaption pour permettre une
  transition "shift-left" (Intégration anticipée et approfondie des tests, de la
  sécurité et de l'assurance qualité au début du cycle de développement
  logiciel, pour une identification et résolution plus précoces des anomalies).
- Éviter les points de défaillance uniques.

## Décision

Notre solution consistera à déployer des clusters Kubernetes sur différents
fournisseurs de cloud. Voici les composants qui seront déployés pour gérer
divers cas d'utilisation

- [Gestion des conteneurs et leur déploiement: Kubernetes](014-containers.fr-ca.md)
- [Gestion des secrets: HashiCorp Vault](012-secret-management.fr-ca.md)
- [Gestion des deployments: ArgoCD](011-gitops.fr-ca.md)
- [Gestion de l'Infrastructure as Code (IaC): Terraform](013-IaC-tool.fr-ca.md)
- Gestion des environnements de développement: AzureML
- [Gestion d'authentification des utilisateurs: Vouch-proxy](015-authentication-management.fr-ca.md)
- Gestion de l'instrumentation des applications: OpenTelemetry et Clickhouse
- Gestion de l'observabilité: Grafana et Prometheus pour collecter des métriques
  spécifiques aux applications déployées avec Helm
- Gestion du load balancing: Ingress NGINX
- Gestion de la securité: Trivy et Falco
c
D'autres composants seront ajoutés au besoin.

## Alternatives Considérées

Cette section présente les différentes options ou solutions considérées avant
d'arriver à la décision finale. Chaque alternative est généralement discutée
dans une sous-section.

### Contour

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

### Kong

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

### Traefik

Avantages :

- Traefik simplifie la configuration automatique et la reconfiguration dynamique
  de certificat SSL. il s'intègre bien avec Kubernetes en gèrant automatiquement
  les certificats SSL/TLS via Let's Encrypt.

Inconvénients :

- Étant donné que notre cluster Kubernetes est hébergé sur Azure (AKS), nous
  avons favorisé NGINX Ingress Controller, qui est plus largement utilisé et
  permet une meilleure intégration avec Azure. On a également préférré NGINX
  Ingress Controller pour sa capacité à gérer l'authentification des
  utilisateurs avec la possibilité de configurer des règles d'authentification
  pour les services.

### HAProxy Ingress

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

### Istio Ingress

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

### Flux

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

### Carvel ytt

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

### cdk8s

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

### kapp-controller

Avantages :

- Aspects positifs de cette alternative.

Inconvénients :

- Aspects négatifs de cette alternative.

## Conséquences

Cette partie décrit les résultats attendus, positifs comme négatifs, de la
décision. Cela peut inclure son impact sur différentes parties prenantes ou
toute action qui doit être prise à la suite de la décision.

## Références

Toute documentation, recherche ou données soutenant la décision peuvent être
citées ici. Cela peut inclure des articles académiques, des articles de blog ou
des documents internes.
