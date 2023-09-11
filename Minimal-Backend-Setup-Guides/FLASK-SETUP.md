# Quickstart: Flask Backend with Dev Containers

## Table of Contents

- [Quickstart: Flask Backend with Dev Containers](#quickstart-flask-backend-with-dev-containers)
  - [Table of Contents](#table-of-contents)
  - [Create the GitHub repository](#create-the-github-repository)
  - [Creating a Flask App](#creating-a-flask-app)
  - [Pushing the App to GitHub](#pushing-the-app-to-github)
  - [Merging the changes](#merging-the-changes)

## Create the GitHub repository

1. Create an empty repository in the organization on GitHub. Give it a meaningful name and description. Make sure to follow the naming patterns of the existing repositories (ie: lowercase, dash instead of underscore...).
2. Protect the main branch: Check `Require a pull request before merging` and `Require Approvals`.
3. Clone the repository to your working directory and open it in VS Code via WSL.
4. Open an issue for the creation of the app. Make sure the title and description are meaningful. Use appropriate labels. Avoid creating new labels specifically for the repository.
5. Checkout to a new branch where the changes will be pushed. Name the branch after the issue (ie, `<username>/issue<issue-number>-a-meaningful-tag`)
6. Create a `devcontainer` as per [this guide](../Development-Environment-Setup-Guide/DEV-EVN-SETUP.md).

## Creating a Flask App

1. Configure `devcontainer.json`:

```json
{
  "name": "Python 3",
  "image": "mcr.microsoft.com/devcontainers/python:3.11",
  "postCreateCommand": "pip3 install --user -r requirements.txt"
}
```

2. At the root of the project, Create a `requirements.txt` file:

```
flask
gunicorn
# additional dependencies
```

3. Create a `requirements-production.txt` file:

```
flask
gunicorn
```

4. Set up the directory structure:

```bash
mkdir src tests && touch src/main.py tests/test_main.py src/__init__.py tests/__init__.py Dockerfile
```

5. Setting up the Flask app:

```python
# src/main.py
from datetime import datetime
from flask import Flask

app = Flask(__name__)

@app.route('/')
def read_root():
    current_time = datetime.now()
    unix_timestamp = int(current_time.timestamp())
    return {"current_time": unix_timestamp}
```

**Note**: Don't run the app from the code (i.e., with: `app.run(host='0.0.0.0', port=8000)`) as this violates several rules from the 12 factor app.

6. Setting up tests:

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

7. Setting up the Dockerfile:

```dockerfile
# Dockerfile
# Base image with Python 3.11 on Alpine
FROM python:3.11-alpine

# Establish /code as working directory in the container
WORKDIR /code

# Copy production requirements and install dependencies
COPY ./requirements-production.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy source code into the working directory
COPY ./src .

# Use Gunicorn as the server, configuring it for the Flask app
ENTRYPOINT gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 --forwarded-allow-ips "*" main:app
```

8. Open the project in Dev Containers or rebuild it if it was already open in Dev Containers.

9. Test the Flask app:

```bash
export PORT=5001
cd src && gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 --forwarded-allow-ips "*" main:app
```

10. Run the tests. From the root:

```bash
python -m unittest discover -s tests
```

11. Test running the app from Dockerfile:

```bash
docker build -t flask-app .
docker run -p $PORT:$PORT -e PORT=$PORT flask-app
```

## Pushing the App to GitHub

1. Create a `.gitignore`:

```
__pycache__/
*.pyc
.cache/
env/
```

2. Create a `README.md`:

```
# Presentation
...
# Steps to Run the Project from Dev Containers
...
# Running the unit tests from Dev Containers
...
# Steps to Run the Project from Dockerfile
...
```

3. Commit and push the changes to the repository. Make sure the commit references the issue (ie, `issue #<issue-number>`). Make sure the commit message is meaningful.
4. Create a Pull Request and submit for review. Make sure the PR references the issue. Make sure the PR's description includes a tag such as `issue<issue-number>-keywords`. Make sure the PR description is meaningful. Make sure to add a reviewer and notify him.

## Merging the changes

If the changes are approved:

1. Add `Closes #<issue-number>` to your PR's description.
2. Merge your PR.
