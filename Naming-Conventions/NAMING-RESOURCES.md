# Naming conventions for CLI-accessible resources

## Introduction
This document outlines the standard naming conventions for resources that are susceptible to be accessed or manipulated via the command-line interface (CLI). The aim is to improve code readability, ease of use, and collaborative work.

## Naming guidelines

### GitHub repositories
- **Convention**: Use lowercase and separate words with dashes.
- **Example**: `my-repo-name`

### Files
- **Convention**: Use lowercase and separate words with dashes.
- **Example**: `my-file.sh`

### Folders/directories
- **Convention**: Use lowercase and separate words with dashes.
- **Example**: `my-folder`

### Environment variables
- **Convention**: Start with the uppercase repository name, followed by the actual variable name, separating words with underscores.
- **Example**: `REPO_NAME_MY_ENV_VAR`

### Azure resource groups
- **Convention**: Start with `rg-` followed by the name in lowercase, separating words with dashes.
- **Example**: `rg-my-resource-group`

### Azure resources
- **Convention**: Use lowercase and separate words with dashes. Include the project name and type of resource.
- **Example**: `my-project-storage-account`

## Notes
- These naming conventions should be followed for all new resources that can be accessed or manipulated via CLI.
- Existing resources that do not conform to these conventions should be refactored to match them.
