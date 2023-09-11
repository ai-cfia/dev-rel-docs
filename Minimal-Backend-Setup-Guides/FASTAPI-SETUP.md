# Quickstart: FastAPI Backend with Dev Containers

## Table of Contents

- [Quickstart: FastAPI Backend with Dev Containers](#quickstart-fastapi-backend-with-dev-containers)
  - [Table of Contents](#table-of-contents)
  - [Create the GitHub repository](#create-the-github-repository)
  - [Creating a FastAPI App](#creating-a-fastapi-app)
  - [Pushing the App to GitHub](#pushing-the-app-to-github)
  - [Merging the changes](#merging-the-changes)

## Create the GitHub repository

Refer to [QuickStart: Flask Backend with Dev Containers](./FLASK-SETUP.md).

## Creating a FastAPI App

1. Configure `devcontainer.json`: refer to [QuickStart: Flask Backend with Dev Containers](./FLASK-SETUP.md).

2. At the root of the project, Create a `requirements.txt` file:

```
fastapi
uvicorn
httpx
# additional dependencies
```

3. Create a `requirements-production.txt` file:

```
fastapi
uvicorn
```

4. Setup the directory structure:

```bash
mkdir src tests && touch src/main.py tests/test_main.py src/__init__.py tests/__init__.py Dockerfile
```

5. Setting up the FastAPI app:

```python
# src/main.py
from datetime import datetime
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    current_time = datetime.now()
    unix_timestamp = int(current_time.timestamp())
    return {"current_time": unix_timestamp}
```

**Note**: Don't run the app from the code (i.e., with: `uvicorn.run(app, host="0.0.0.0", port=8000)`) as this violates several rules from the [12 factor app](https://12factor.net).

6. Setting up tests:

```python
# tests/test_main.py
import time
from fastapi.testclient import TestClient
from src.main import app
import unittest

client = TestClient(app)

class TestFastAPIApp(unittest.TestCase):

    def test_read_root(self):
        response = client.get("/")
        self.assertEqual(response.status_code, 200)
        self.assertIn("current_time", response.json())

    def test_query_performance(self):
        start_time = time.time()
        response = client.get("/")
        self.assertEqual(response.status_code, 200)

        elapsed_time = time.time() - start_time
        self.assertTrue(elapsed_time < 0.200)
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

# Use Gunicorn as the server, configuring it for the FastAPI app
ENTRYPOINT uvicorn main:app --host 0.0.0.0 --port $PORT
```

8. Open the project in Dev Containers or rebuild it if it was already open in Dev Containers.

9. Test the FastAPI app:

```bash
export PORT=5001
cd src && uvicorn main:app --port $PORT
```

10. Run the tests. From the root:

```bash
python -m unittest discover -s tests
```

11. Test running the app from Dockerfile:

```bash
docker build -t fastapi-app .
docker run -p $PORT:$PORT -e PORT=$PORT fastapi-app
```

## Pushing the App to GitHub

Refer to [QuickStart: Flask Backend with Dev Containers](./FLASK-SETUP.md).

## Merging the changes

Refer to [QuickStart: Flask Backend with Dev Containers](./FLASK-SETUP.md).
