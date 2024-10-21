# Readme de TS-AppVersion

TS-AppVersion est un package conçu pour extraire les informations de version à
partir du fichier package.json d'un projet et de Git (si configuré) et pour les
sauvegarder dans un fichier TypeScript. Ce package est destiné à être utilisé
avec des frameworks JavaScript basés sur TypeScript, tels que Angular.

## Fonctionnalités clés et utilisation

**Installation** :

```bash
npm i @saithodev/ts-appversion
```

### Exécution du script

Avant de build l'application, vous devez exécuter le script TS-AppVersion. Cela
peut être réalisé en utilisant les scripts "prestart" et "prebuild" dans votre
package.json :

## Pour commencer

package.json :

```json
{
  "scripts": {
    "prestart": "ts-appversion",
    "prebuild": "ts-appversion"
  }
}
```

Le package est livré avec un script qui doit être exécuté avant que votre
application ne soit construite. Vous pouvez utiliser prestart et prebuild dans
votre package.json pour cela.

## Arguments de la commande

Le package fournit plusieurs arguments de commande pour personnaliser son
comportement, tel que la spécification du répertoire racine, de l'emplacement de
fichier de sortie, de l'emplacement du dossier Git et plus encore.

## Réception des versions

Le script (npm i @saithodev/ts-appversion) génère un fichier TypeScript
(emplacement par défaut : ./src/_versions.ts) qui exporte un objet contenant
diverses variables liées à la version extraites du fichier package.json et du
dépôt Git (si disponible). Ces variables incluent :

```text
version
name
description
versionDate
versionLong
gitTag
gitCommitHash
gitCommitDate
```

## Versions liées à l'environnement

Dans certains cas, il pourrait être préférable de ne pas afficher le numéro de
version ou seulement la notation courte. Vous pouvez utiliser les environnements
pour afficher différentes informations de version.

environments/environment.ts :

```typescript
import versions from '../_versions';

export const environment = {
  production: false,
  version: versions.version,
};
```

environments/environment.staging.ts :

```typescript
import versions from '../_versions';

export const environment = {
  production: false,
  version: versions.version,
};
```

environments/environment.prod.ts :

```typescript
import versions from '../_versions';

export const environment = {
  production: true,  // Notez que la production est mis à 'true' ici pour l'environnement de production
  version: versions.version,
};
```

## Exemple d'accès à la version dans le composant Environment

app.component.ts :

```typescript
import { environment } from '../environments/environment';

export class AppComponent {
  return (
    {environment.version !== "" ? "v" + environment.version : ""}{" "}
  );
}
```

Globalement, TS-AppVersion simplifie le processus de gestion des informations de
version dans les projets basés sur TypeScript et offre une flexibilité pour
afficher différents détails de version en fonction de l'environnement de
l'application.
