# Création d'une Application React avec TypeScript + SWC et Vite, ESLint et Prettier

Ce guide vous accompagne dans les étapes de configuration d'une application
React en utilisant Vite avec TypeScript et SWC, et l'améliore encore avec ESLint
pour le linting de code et Prettier pour la mise en forme du code. Suivre ces
étapes vous aidera à maintenir une base de code propre, cohérente et efficace.

## Table des Matières

- [Pour Commencer](#pour-commencer)
  - [Prérequis](#prérequis)
  - [Installation](#installation)
- [Étape 1 : Configuration du Projet avec Vite et SWC](#étape-1--configuration-du-projet-avec-vite-et-swc)
  - [Pourquoi Vite et SWC ?](#pourquoi-vite-et-swc-)
- [Étape 2 : Étapes pour Intégrer ESLint et Prettier](#étape-2--étapes-pour-intégrer-eslint-et-prettier)
- [Étape 3 : Dans le fichier .eslintrc.cjs, remplacez le contenu existant par la configuration suivante](#étape-3--dans-le-fichier-eslintrccjs-remplacez-le-contenu-existant-par-la-configuration-suivante)
- [Étape 4 : Dans le fichier package.json, ajoutez les deux lignes suivantes dans la section "scripts"](#étape-4--dans-le-fichier-packagejson-ajoutez-les-deux-lignes-suivantes-dans-la-section-scripts)
- [Étape 5 : Pour formater tout le code du projet, exécutez](#étape-5--pour-formater-tout-le-code-du-projet-exécutez)
- [Étape 6 : Pour exécuter ESLint, exécutez](#étape-6--pour-exécuter-eslint-exécutez)

## Pour Commencer

Ces instructions vous permettront de lancer et d'exécuter une copie du projet
sur votre machine locale à des fins de développement et de test.

### Prérequis

Avant de commencer, assurez-vous que Node.js est installé sur votre système. Ce
projet utilise Node.js pour la gestion de paquets et l'exécution de scripts.

### Installation

Pour configurer le projet sur votre machine locale :

1. Clonez le dépôt sur votre machine locale.
2. Changez dans le répertoire du projet.
3. Installez les dépendances requises.

## Étape 1 : Configuration du projet avec Vite et SWC

1. Ouvrez votre terminal.
2. Naviguez vers le répertoire souhaité.
3. Exécutez la commande pour créer un nouveau projet Vite. Vous devrez entrer le
nom du projet et sélectionner des options pour le framework et la variante :
    - Commande : `npm create vite@latest`
    - Nom du projet : Entrez le nom de votre projet.
    - Sélectionnez le framework : React
    - Sélectionnez la variante : TypeScript + SWC
4. Après la fin du scaffolding, naviguez dans le répertoire de votre projet.
5. Installez les dépendances requises.
6. Démarrez le serveur de développement. Votre application sera disponible à une
   URL de serveur local.

### Pourquoi Vite et SWC ?

#### Avantages de Vite sur npx create-react-app

- Temps de Build Plus Rapide : Vite améliore considérablement le temps de build
  avec un serveur de développement basé sur les modules ESM.
- Fonctionnalités Prêtes à l'Emploi : Vite comprend le remplacement de module à
  chaud (HMR) et le support de TypeScript.
- Configuration Simplifiée : Vite nécessite une configuration minimale par
  rapport à create-react-app.
- Dépréciation de CRA : create-react-app a été déprécié début 2023, favorisant
  davantage l'adoption d'outils plus modernes comme Vite.

#### Avantages de l'utilisation de SWC

- Performance : SWC offre une compilation plus rapide du TypeScript/JavaScript
  que les compilateurs traditionnels comme Babel.
- Bundling Efficace : SWC comprend le regroupement (bundling) et la minification
  pour des performances de production améliorées.
- Moins de Configuration : SWC simplifie le processus de configuration pour
  TypeScript et le JavaScript moderne.

## Étape 2 : Étapes pour intégrer ESLint et Prettier

`npm install --save-dev prettier eslint-config-prettier eslint-plugin-prettier`

## Étape 3 : Dans le fichier .eslintrc.cjs, remplacez le contenu existant par la configuration suivante

```javascript
module.exports = {
  root: true,
  env: { browser: true, es2020: true },
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:react-hooks/recommended",
  ],
  ignorePatterns: ["dist", ".eslintrc.cjs"],
  parser: "@typescript-eslint/parser",
  plugins: ["react-refresh", "@typescript-eslint", "prettier"],
  rules: {
    "react/prop-types": "off",
    "react/react-in-jsx-scope": "off",
    "prettier/prettier": [
      "error",
      {
        endOfLine: "auto",
      },
    ],
  },
};
```

## Étape 4 : Dans le fichier package.json, ajoutez les deux lignes suivantes dans la section "scripts"

```json
"lint": "eslint .",
"lint:fix": "eslint --fix ."
```

## Étape 5 : Pour formater tout le code du projet, exécutez

`npx prettier --write .`

## Étape 6 : Pour exécuter ESLint, exécutez

`npm run lint`
