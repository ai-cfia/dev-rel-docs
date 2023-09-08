# Dev Environment Setup Guide

This guide introduces the use of Visual Studio Code's Dev Containers, aiming to provide a consistent development environment.

## Table of Contents

- [Dev Environment Setup Guide](#dev-environment-setup-guide)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Setting up Windows Subsystem for Linux (Optional for Windows Users)](#setting-up-windows-subsystem-for-linux-optional-for-windows-users)
    - [Steps:](#steps)
  - [Docker Installation without Docker Desktop](#docker-installation-without-docker-desktop)
      - [Installing Docker in WSL 2 on Windows:](#installing-docker-in-wsl-2-on-windows)
    - [For Linux:](#for-linux)
    - [For macOS:](#for-macos)
  - [Dev Containers in Visual Studio Code](#dev-containers-in-visual-studio-code)

## Requirements

Before proceeding, ensure you have:

- **Visual Studio Code**
- **VS Code Extensions**: Install `Remote Development` or install `WSL` and `Dev COntainers` separatly.

## Setting up Windows Subsystem for Linux (Optional for Windows Users)

For those on Windows, WSL offers the versatility of Linux without leaving the Windows environment, enhancing security through added isolation. WSL 2 is recommended over WSL 1 due to its improved performance, full Linux kernel integration, and better Docker compatibility.

Follow the [WSL installation guide](https://docs.microsoft.com/en-us/windows/wsl/install).

TODO: git


## Docker Installation without Docker Desktop

Dev Containers use Docker which is a platform designed to make it easier to develop, ship, and run applications inside containers. Containers package up the code and all its dependencies, ensuring the application runs in the same manner regardless of where it is deployed, leading to consistent environments and streamlined workflows. 

Docker Desktop provides a convenient interface for managing containers on Windows and Mac, but could require a paid subscription. Below is a guide to install Docker Server and Docker CLI which are free of charge.

#### Installing Docker in WSL 2 on Windows
    
Inside your WSL 2 Linux distribution:
   ```bash
   sudo apt-get update
   sudo apt-get install docker.io
   sudo service docker start
   sudo usermod -aG docker $USER
   ```
The `sudo usermod -aG docker $USER` command is essential as it adds the current user to the Docker group, enabling you to run Docker commands without requiring sudo for every command.

### For Linux:

1. **Install Docker Engine**: Choose your distro and follow the [Docker Engine installation guide for Linux](https://docs.docker.com/engine/install/).
2. **Install Docker Compose**: Refer to [Docker Compose installation on Linux](https://docs.docker.com/compose/install/).

### For macOS:

While Docker Desktop is the primary method for macOS users, those seeking an alternative can use Docker Machine in conjunction with VirtualBox. This approach might not be as seamless as Docker Desktop, but it provides a way to run Docker without the potential licensing restrictions.


## Dev Containers in Visual Studio Code

### Configuration 
Configure the `Dev Containers` extension to run in `WSL`:
1. In Command Palette, type `Dev Container: Settings` and select it or go to: Extensions > Dev Containers > Settings > Extension Settings
2. In the page search for the option `Execute in WSL` and checkmark it.


### 


