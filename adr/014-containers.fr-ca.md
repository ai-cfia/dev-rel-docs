# ADR-014 : Conteneurisation

## Résumé exécutif

L'utilisation de conteneurs et de Kubernetes s'est avérée efficace pour la
gestion et le déploiement de nos applications. Cette approche offre plusieurs
avantages, notamment la portabilité, qui permet aux conteneurs de s'exécuter
de manière cohérente sur différents environnements, simplifiant ainsi le
développement et le déploiement. L'évolutivité est également un point fort,
car Kubernetes permet de faire évoluer facilement les applications en fonction
de la demande. En termes de fiabilité, les conteneurs et Kubernetes offrent une
meilleure résistance aux pannes et une haute disponibilité. Enfin, l'efficacité
est améliorée grâce à l'utilisation de conteneurs qui optimise l'utilisation
des ressources et réduit les coûts.

## Contexte

Auparavant, nous gérions nos applications dans des répertoires avec des
Dockerfiles. Cette approche, bien que fonctionnelle, présentait certaines
limitations telles que le manque d'orchestration, car déployer et gérer
manuellement les conteneurs était fastidieux et sujet à des erreurs. De plus,
l'évolutivité était limitée, il était difficile de faire évoluer les
applications au-delà d'un certain nombre de serveurs. Enfin, la surveillance
et la journalisation des applications conteneurisées étaient difficiles et
manquaient de centralisation.

## Décision

Pour pallier ces limitations, nous avons décidé d'adopter Kubernetes pour
l'orchestration des conteneurs. Cette décision s'est avérée judicieuse pour
plusieurs raisons: Kubernetes offre une interface intuitive pour la gestion
des conteneurs, ce qui simplifie son utilisation. Il permet également de faire
évoluer les applications horizontalement en ajoutant ou en supprimant des nœuds
au cluster, assurant ainsi une évolutivité optimale.  De plus, Kubernetes assure
la haute disponibilité des applications en cas de défaillance d'un nœud,
garantissant ainsi une meilleure résilience. Enfin, il offre des outils de
surveillance et de journalisation intégrés, facilitant le suivi et la
maintenance des applications.

## Alternatives Considérées

### Docker Swarm

Avantages:

Conséquences:

### Nomad

Avantages:

Conséquences:

## Conclusion

L'adoption de Kubernetes s'est avérée être une décision judicieuse pour
la gestion et le déploiement de nos applications conteneurisées.
Cette approche a permis d'améliorer la portabilité, l'évolutivité,
la fiabilité ainsi que l'efficacité de nos applications.
