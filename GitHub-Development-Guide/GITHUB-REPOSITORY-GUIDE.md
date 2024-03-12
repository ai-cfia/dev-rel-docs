# GitHub Repository Guide

This document provides guidelines and best practices for creating repositories,
workflows, and other GitHub-related topics.

## Creating a new repository in the Organization

1. Go to the Organization's page and click on "New" in the Repositories section.
1. Choose a meaningful name for your repository, following the existing naming
   patterns (e.g., lowercase, dash instead of underscore).
1. Provide a meaningful description for your repository.
1. Set the repository visibility to "Public".
1. Chose as a repository template the repo-template.
1. After the repository is created, protect the main branch by following these
   steps:
    - Go to the repository's "Settings" tab.
    - Click on "Branches" in the left sidebar.
    - Write "main" for the branch name pattern
    - Under "Branch protection rules", select the main branch.
    - Enable the options to "Require a pull request before merging"
      - Under "Require a pull request before merging", enable the options
        "Require approvals" and "Require review from Code Owners".
    - Click on "Collaborators and teams"
    - Add one of these teams depending on the nature of the project: "backend",
      "data", "datascience" or "frontend".
1. Follow the chapter ["Creating a Workflow"](#creating-a-workflow) to add
   GitHub actions to your repository.

## Creating a Workflow

1. To understand and select the appropriate workflows for your project, refer to
   the [GitHub Workflows
   repository](https://github.com/ai-cfia/github-workflows/tree/main/.github/workflows)
   and read the documentation provided in each `.md` file.
1. Customize the YAML file located in `.github/workflows` to define your
   workflow steps, triggers, and actions based on your project requirements.
1. Follow this
   [example](https://github.com/ai-cfia/finesse-backend/blob/main/.github/workflows/python-backend-workflows.yml)
