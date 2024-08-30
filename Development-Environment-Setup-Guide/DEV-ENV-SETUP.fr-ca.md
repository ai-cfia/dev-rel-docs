# Guide de Configuration de l'Environnement de Développement

Ce guide introduit l'utilisation des Conteneurs de Développement de Visual
Studio Code pour fournir un environnement de développement cohérent.

## Prérequis

Avant de continuer, assurez-vous d'avoir :

- **Visual Studio Code**
- **Extensions VS Code** : Installez soit `Remote Development`, soit à la fois
  `WSL` et `Dev Containers`.

## Configuration du Sous-système Windows pour Linux

Installez WSL 2 pour de meilleures performances et une compatibilité avec
Docker. Suivez le [guide d'installation de
WSL](https://docs.microsoft.com/fr-fr/windows/wsl/install).

## Installation de Docker

Installez Docker dans WSL 2 :

```bash
sudo apt-get update
sudo apt-get install docker.io
sudo service docker start
sudo usermod -aG docker $USER
```

Note : La dernière commande ajoute l'utilisateur actuel au groupe Docker pour
exécuter les commandes Docker sans `sudo`.

## Conteneurs de Développement dans VS Code

### Configuration

1. Ouvrez la Palette de Commandes (`Ctrl+Shift+P`), sélectionnez `Dev Container
   : Settings`.
2. Cochez `Exécuter dans WSL`.

### Créer un Conteneur de Développement

1. Ouvrez VS Code.
2. Ouvrez la Palette de Commandes, sélectionnez `WSL : Connecter à WSL`.
3. Ouvrez le terminal : `Terminal > Nouveau terminal` ou `` Ctrl+` ``.
4. Créez le dossier de votre projet dans votre répertoire de travail :

  ```bash
     mkdir <dossier-de-votre-projet>
  ```

1. Dans la Palette de Commandes, sélectionnez `WSL : Ouvrir le dossier dans
WSL...` et choisissez le dossier de votre projet.
2. Dans la Palette de Commandes, sélectionnez `Dev Containers : Ajouter des
fichiers de configuration de Conteneur de Développement...`, puis sélectionnez
un modèle correspondant à vos besoins, par exemple : `Python 3`, puis
sélectionnez la version qui vous intéresse, par exemple `3.11.bullseye`. Cliquez
sur `OK`.
3. Configurez le fichier `devcontainer.json` selon vos besoins. Consultez la
[Directives pour la configuration de Conteneur de Développement]
(#directives-pour-la-configuration-de-conteneur-de-développement).
4. Dans la Palette de Commandes, sélectionnez `Dev Containers : Ouvrir le
   dossier dans un Conteneur...`.
5. Une fois dans l'environnement conteneurisé, vous pouvez commencer à
   développer.

### Ouvrir un Projet de Conteneur de Développement Existante

1. Ouvrez VS Code.
2. Ouvrez la Palette de Commandes, sélectionnez `WSL : Connecter à WSL`.
3. Dans la Palette de Commandes, sélectionnez `WSL : Ouvrir le dossier dans
WSL...` et choisissez votre projet.
4. Dans la Palette de Commandes, sélectionnez `Dev Containers : Ouvrir le
   dossier dans un Conteneur...`.

### Directives pour la Configuration de Conteneur de Développement

#### Configuration minimum

Assurez-vous d'inclure les champs suivants :

- **name** : Nom du conteneur pour VS Code.
- **image** : L'image Docker à utiliser. Nous recommandons d'utiliser les images
  de base de Conteneurs de Développement fournies par Microsoft : [GitHub](https://github.com/devcontainers/images).
- **postCreateCommand** : Commandes qui seront exécutées après la création du
  conteneur. Cela est utile pour l'installation des dépendances ou les tâches de
  configuration initiale.

Pour une liste complète des options, référez-vous à la [documentation
officielle](https://containers.dev/implementors/json_reference/).

#### Extensions par défaut

Pour ajouter des extensions VS Code à votre Conteneur de Développement, utilisez
le champ `customizations`.

Pour les projets `python` :

```json
{
  "customizations": {
    "vscode": {
      "extensions": [
        "charliermarsh.ruff",
        "GitHub.vscode-pull-request-github",
        "ms-python.python",
        "ms-python.black-formatter"
      ]
    }
  }
}
```

Pour les projets `sql + shell + python` :

```json
{
  "customizations": {
    "vscode": {
      "extensions": [
        "charliermarsh.ruff",
        "GitHub.vscode-pull-request-github",
        "ms-python.python",
        "ms-python.black-formatter",
        "timonwong.shellcheck"
      ]
    }
  }
}
```

#### Créer ou se connecter à un réseau de conteneurs

Si vous avez besoin de connecter votre conteneur à un réseau de conteneurs
existant ou d'en créer un nouveau, ajoutez ces champs à votre
`devcontainer.json` :

```json
{
  "initializeCommand": "docker network inspect ailab_network > /dev/null || docker network create ailab_network --attachable",

  "runArgs": [
    "--dns=8.8.8.8",
    "--hostname=<nom-du-dépôt>",
    "--network=ailab_network"
  ]
}
```
