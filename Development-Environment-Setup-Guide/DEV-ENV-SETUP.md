# Development Environment Setup Guide

This guide introduces the use of Visual Studio Code's Dev Containers to provide
a consistent development environment.

## Requirements

Before proceeding, ensure you have:

- **Visual Studio Code**
- **VS Code Extensions**: Install either `Remote Development` or both `WSL`
and `Dev Containers`.

## Setting up Windows Subsystem for Linux

Install WSL 2 for better performance and Docker compatibility. Follow the
[WSL installation guide](https://docs.microsoft.com/en-us/windows/wsl/install).

## Docker Installation

Install Docker in WSL 2:

```bash
sudo apt-get update
sudo apt-get install docker.io
sudo service docker start
sudo usermod -aG docker $USER
```

Note: The last command adds the current user to the Docker group to run Docker
commands without `sudo`.

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

5. In Command Palette, select `WSL: Open Folder in WSL...` and choose your
project folder.
6. In Command Palette, select
`Dev Containers: Add Dev Container Configuration Files..`, then select a
template that suits your needs, for instance: `Python 3`, then select the
version you're interested in, for instance `3.11.bullseye`. Click `OK`.
7. Configure the `devcontainer.json` file to suit your needs. See the
[Directives for Dev Container Configuration]
(#directives-for-dev-container-configuration).
8. In the Command Palette, select `Dev Containers: Open Folder in Container...`.
9. Once inside the containerized environment, you can start developing.

### Open an Existing Dev Container Project

1. Open VS Code.
2. Open Command Palette, select `WSL: Connect to WSL`.
3. In Command Palette, select `WSL: Open Folder in WSL...` and choose your
project.
4. In Command Palette, select `Dev Containers: Open Folder in Container...`.

### Directives for Dev Container Configuration

#### Minimum configuration

Make sure to include the following fields:

- **name**: Container name for VS Code.
- **image**: The Docker image to use. We recommended using the Dev Container
base images provided by Microsoft: [GitHub](
https://github.com/devcontainers/images).
- **postCreateCommand**: Commands that will execute after the container's
creation. This is useful for the installation of dependencies or initial setup
tasks.

For a comprehensive list of options, refer to the [official documentation](
https://containers.dev/implementors/json_reference/).

#### Default extensions

To add VS Code extensions to your Dev Container, use the `customization` field.

For `python` projects:

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

For `sql + shell + python` projects:

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

#### Create or connect to a container network

If you need to connect your container to a container network or create a
new one, add these fields to your `devcontainer.json`:

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
