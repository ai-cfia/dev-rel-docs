# Development Environment Setup Guide

This guide introduces the use of Visual Studio Code's Dev Containers to provide a consistent development environment.

## Requirements

Before proceeding, ensure you have:

- **Visual Studio Code**
- **VS Code Extensions**: Install either `Remote Development` or both `WSL` and `Dev Containers`.

## Setting up Windows Subsystem for Linux

Install WSL 2 for better performance and Docker compatibility. Follow the [WSL installation guide](https://docs.microsoft.com/en-us/windows/wsl/install).

## Docker Installation

Install Docker in WSL 2:

```bash
sudo apt-get update
sudo apt-get install docker.io
sudo service docker start
sudo usermod -aG docker $USER
```

Note: The last command adds the current user to the Docker group to run Docker commands without `sudo`.

## Dev Containers in VS Code

### Configuration

1. Open Command Palette (`Ctrl+Shift+P`), select `Dev Container: Settings`.
2. check `Execute in WSL`.

### Create a Dev Container

1. Open VS Code.
2. Open Command Palette, select `WSL: Connect to WSL`.
3. Open terminal: `Terminal > New Terminal` or `` Ctrl+` ``.
4. Create your project's folder in your working directory:

```bash
mkdir <your-project-folder>
```

5. In Command Palette, select `WSL: Open Folder in WSL...` and choose your project folder.
6. In Command Palette, select `Dev Containers: Add Dev Container Configuration Files..`, then select `Python 3`, then select the version you're interested in, for instance `3.11.bullseye`. Click `OK`.
7. Uncomment the `postCreateCommand` to allow the container to install the dependencies in `requirements.txt`.

```javascript
//.devcontainer/devcontainer.json
// For format details, see https://aka.ms/devcontainer.json. For config options, see the
// README at: https://github.com/devcontainers/templates/tree/main/src/python
{
  "name": "Python 3",
  // Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
  "image": "mcr.microsoft.com/devcontainers/python:1-3.11-bullseye",

  // Features to add to the dev container. More info: https://containers.dev/features.
  // "features": {},

  // Use 'forwardPorts' to make a list of ports inside the container available locally.
  // "forwardPorts": [],

  // Use 'postCreateCommand' to run commands after the container is created.
  "postCreateCommand": "pip3 install --user -r requirements.txt"

  // Configure tool-specific properties.
  // "customizations": {},

  // Uncomment to connect as root instead. More info: https://aka.ms/dev-containers-non-root.
  // "remoteUser": "root"
}
```

8.  In the Command Palette, select `Dev Containers: Open Folder in Container...`.
9.  Once inside the containerized environment, you can start developing.

### Open an Existing Dev Container Project

1. Open VS Code.
2. Open Command Palette, select `WSL: Connect to WSL`.
3. In Command Palette, select `WSL: Open Folder in WSL...` and choose your project.
4. In Command Palette, select `Dev Containers: Open Folder in Container...`.

### Directives for Dev Container Configuration

#### Minimum configuration

Make sure to include the following fields:

- **name**: Container name for VS Code.
- **image**: The Docker image to use. We recommended using the Dev Container base images provided by Microsoft: [Docker Hub](https://hub.docker.com/_/microsoft-devcontainers?tab=description).
- **postCreateCommand**: Commands that will execute after the container's creation. This is useful for the installation of dependencies or initial setup tasks.

For a comprehensive list of options, refer to the [official documentation](https://containers.dev/implementors/json_reference/).

#### Create or connect to a container network

If you need to connect your container to a container network or create a new one, add these fields to your `devcontainer.json`:

```json
{
  "initializeCommand": "docker network inspect ailab_network > /dev/null || docker network create ailab_network --attachable",

  "runArgs": [
    "--dns=8.8.8.8",
    "--hostname=<repository-name>",
    "--network=ailab_network"
  ]
}
```
