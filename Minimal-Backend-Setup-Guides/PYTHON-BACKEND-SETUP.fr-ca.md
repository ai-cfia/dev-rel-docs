# Démarrage rapide : Backend Flask avec Dev Containers

## Création du dépôt GitHub

1. Créez un dépôt vide dans l'organisation sur GitHub. Donnez-lui un nom et une
   description significatifs. Assurez-vous de suivre les modèles de nommage des
   dépôts existants (par exemple : minuscules, tiret au lieu de souligné...).
2. Protégez la branche principale : Cochez `Require a pull request before
   merging` et `Require Approvals`.
3. Clonez le dépôt dans votre répertoire de travail et ouvrez-le dans VS Code
   via WSL.
4. Ouvrez une issue pour la création de l'application. Assurez-vous que le titre
   et la description sont significatifs. Utilisez des étiquettes appropriées.
   Évitez de créer de nouvelles étiquettes spécifiquement pour le dépôt.
5. Basculer vers une nouvelle branche où les modifications seront poussées.
   Nommez la branche d'après l'issue (par exemple,
   `<username>/issue<issue-number>-a-meaningful-tag`)
6. Créez un `devcontainer` conformément à [ce
   guide](../Development-Environment-Setup-Guide/DEV-ENV-SETUP.md).

## Création d'une application Flask

1. Configurez `devcontainer.json` :

     ```json
     {
     "name": "Python 3",
     "image": "mcr.microsoft.com/devcontainers/python:3.11",
     "postCreateCommand": "pip3 install --user -r requirements.txt"
     }
     ```

2. À la racine du projet, créez un fichier `requirements.txt` :

     ```text
     flask
     gunicorn
     # dépendances supplémentaires
     ```

3. Créez un fichier `requirements-production.txt` :

     ```text
     flask
     gunicorn
     ```

4. Configurez la structure des répertoires :

     ```bash
     mkdir src tests && touch src/main.py tests/test_main.py src/__init__.py tests/__init__.py Dockerfile
     ```

5. Configuration de l'application Flask :

     ```python
     # src/main.py
     from datetime import datetime
     from flask import Flask

     app = Flask(__name__)

     @app.route('/')
     def read_root():
         current_time = datetime.now()
         timestamp_unix = int(current_time.timestamp())
         return {"current_time": timestamp_unix}
     ```

     **Note** : Ne lancez pas l'application depuis le code (c'est-à-dire avec :
     `app.run(host='0.0.0.0', port=8000)`), car cela enfreint plusieurs règles
     du [12 factor app](https://12factor.net/fr/).

6. Configuration des tests :

     ```python
     # tests/test_main.py
     import unittest
     from src.main import app

     class TestApp(unittest.TestCase):

         def setUp(self):
             self.app = app.test_client()
             self.app.testing = True

         def test_read_root(self):
             response = self.app.get('/')
             data = response.get_json()
             self.assertEqual(response.status_code, 200)
             self.assertTrue('current_time' in data)
             self.assertIsInstance(data['current_time'], int)
     ```

7. Configuration du Dockerfile :

     ```dockerfile
     # Dockerfile
     # Image de base avec Python 3.11 sur Alpine
     FROM python:3.11-alpine

     # Établissement de /code comme répertoire de travail dans le conteneur
     WORKDIR /code

     # Copie des exigences de production et installation des dépendances
     COPY ./requirements-production.txt requirements.txt
     RUN pip3 install --no-cache-dir -r requirements.txt

     # Copie du code source dans le répertoire de travail
     COPY ./src .

     # Utilisation de Gunicorn comme serveur, le configurant pour l'application Flask
     ENTRYPOINT gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 --forwarded-allow-ips "*" main:app
     ```

8. Ouvrez le projet dans Dev Containers ou rebuildez-le s'il était déjà ouvert
   dans Dev Containers.

9. Testez l'application Flask :

     ```bash
     export PORT=5001
     cd src && gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 --forwarded-allow-ips "*" main:app
     ```

10. Exécutez les tests. Depuis la racine :

     ```bash
     python -m unittest discover -s tests
     ```

11. Testez l’exécution de l’application à partir du Dockerfile :

     ```bash
     docker build -t flask-app .
     docker run -p $PORT:$PORT -e PORT=$PORT flask-app
     ```

## Pousser l'application sur GitHub

1. Créez un `.gitignore` :

     ```text
     __pycache__/
     *.pyc
     .cache/
     env/
     ```

2. Créez un `README.md` :

     ```markdown
     # Présentation
     ...
     # Étapes pour exécuter le projet depuis les Dev Containers
     ...
     # Exécution des tests unitaires depuis les Dev Containers
     ...
     # Étapes pour exécuter le projet à partir du Dockerfile
     ...
     ```

3. Commitez et poussez les modifications sur le dépôt. Assurez-vous que le
commit fait référence à l'issue (par exemple, `issue #<issue-number>`).
Assurez-vous que le message de commit est significatif.
4. Créez une Pull Request et soumettez-la pour révision. Assurez-vous que la PR
fait référence à l'issue. Assurez-vous que la description de la PR inclut un tag
tel que `issue<issue-number>-keywords`. Assurez-vous que la description de la PR
est significative. Assurez-vous d'ajouter un reviewer et de le notifier.

## Fusionner les modifications

Si les modifications sont approuvées :

1. Ajoutez `Closes #<issue-number>` à la description de votre PR.
2. Fusionnez (*merge*) votre PR.
