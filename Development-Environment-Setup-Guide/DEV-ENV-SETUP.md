# Development Environment Setup Guide

This guide introduces the use of Visual Studio Code's Dev Containers to provide a consistent development environment.

## Table of Contents

- [Development Environment Setup Guide](#development-environment-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Setting up Windows Subsystem for Linux](#setting-up-windows-subsystem-for-linux)
  - [Docker Installation](#docker-installation)
  - [Dev Containers in VS Code](#dev-containers-in-vs-code)
    - [Configuration](#configuration)
    - [Create a Dev Container](#create-a-dev-container)
    - [Open an Existing Dev Container Project](#open-an-existing-dev-container-project)
    - [Directives for Dev Container Configuration](#directives-for-dev-container-configuration)

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
4. `cd path/to/your-directory`
5. Create the dev container structure:

```bash
mkdir -p your-folder-name/.devcontainer && touch your-folder-name/.devcontainer/devcontainer.json
```

6. In Command Palette, select `WSL: Open Folder in WSL...` and choose your folder.
7. Configure `devcontainer.json`. Example for Python 3 with `requirements.txt`:

```json
{
  "name": "Python 3",
  "image": "mcr.microsoft.com/devcontainers/python:3.11",
  "postCreateCommand": "pip3 install --user -r requirements.txt"
}
```

8. In the Command Palette, select `Dev Containers: Open Folder in Container...`.
9. Once inside the containerized environment, you can start developing.

### Open an Existing Dev Container Project

1. Open VS Code.
2. Open Command Palette, select `WSL: Connect to WSL`.
3. In Command Palette, select `WSL: Open Folder in WSL...` and choose your project.
4. In Command Palette, select `Dev Containers: Open Folder in Container...`.

### Directives for Dev Container Configuration

Ensure to include the following fields:

- **name**: Container name for VS Code.
- **image**: The Docker image to use. We recommended using the Dev Container base images provided by Microsoft: [Docker Hub](https://hub.docker.com/_/microsoft-devcontainers?tab=description).
- **postCreateCommand**: Commands that will execute after the container's creation. This is useful for the installation of dependencies or initial setup tasks.

For a comprehensive list of options, refer to the [official documentation](https://containers.dev/implementors/json_reference/).
