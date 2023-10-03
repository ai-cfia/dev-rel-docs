## Context
This intake checklist serves as a structured guide for both internal team members and external contributors to keep track of the progress and ensure the seamless advancement of the project. It has been designed to promote transparency, clarify expectations, and aid in the meticulous documentation and development of the project.

## Introduction
The purpose of this document is to provide a clear and concise set of tasks and prerequisites that need to be addressed for the successful initialization, documentation, development, and deployment of the project. It serves as a mutual reference point, allowing contributors to stay informed about the project’s status and understand the completion state of different components and documentation. Each item in the checklist represents a crucial step in the project lifecycle and is essential for maintaining the quality and integrity of the project.

## Pre-requisites
Before proceeding with this checklist, please ensure that:
- The project has reached a stage where a software solution has been prototyped and is ready to be developed into a production-ready product.
- You have read and understood the guidelines and objectives outlined in each section.
- You consult the linked resources for detailed
information and guidance on the tasks mentioned.

## Context
This intake checklist serves as a structured guide for both internal team members and external contributors to keep track of the progress and ensure the seamless advancement of the project. It has been designed to promote transparency, clarify expectations, and aid in the meticulous documentation and development of the project.

## Introduction
The purpose of this document is to provide a clear and concise set of tasks and prerequisites that need to be addressed for the successful initialization, documentation, development, and deployment of the project. It serves as a mutual reference point, allowing contributors to stay informed about the project’s status and understand the completion state of different components and documentation. Each item in the checklist represents a crucial step in the project lifecycle and is essential for maintaining the quality and integrity of the project.

## Pre-requisites
Before proceeding with this checklist, please ensure that:
- The project has reached a stage where a software solution has been prototyped and is ready to be developed into a production-ready product.
- You have read and understood the guidelines and objectives outlined in each section.
- You consult the linked resources for detailed
information and guidance on the tasks mentioned.


## Checklist

* [ ] **Project Initialization and Documentation**
   * [ ] Internal AI Project intake and criteria for internal AI products.
   * [ ] Product functionality explained in the Wiki.
   * [ ] [GitHub project created](https://github.com/orgs/ai-cfia/projects) for managing the product.
   * [ ] [Configure repository to our own internal standards](https://github.com/ai-cfia/devops/blob/main/github-repository-creation-guide.md).
   * [ ] Architecture documented with a diagram.

* [ ] **Developer Documentation**
   * [ ] Setup and installation guide.
   * [ ] Tests documentation.

* [ ] **Testing**
   * [ ] Automated unit test suite
   * [ ] Unit test suite implemented with a minimum of X% code coverage.
   * [ ]  Manual test plan established.


* [ ] **Continuous Integration and Deployment**
   * [ ] Continuous lint, test, build, and deployment pipeline established.
   * [ ] Code conforms to linting standards.
   * [ ] Code builds into a container without errors.
   * [ ] Code deployable to the cloud and accessible via a publicly available URL.
   > **References:**
   > - [GCP Deployment Guide](https://github.com/ai-cfia/devops/blob/main/gcp-setup-script/gcp-project-setup-guide.md)
   > - [Reusable workflows](https://github.com/ai-cfia/github-workflows/tree/main/.github/workflows)

* [ ] **Monitoring and Reporting**
   * [ ] Monitoring and reporting mechanisms in place.
   * [ ] Reporting of daily active users available.
   > **Resources:**
   > - [Understanding GitHub Actions](https://docs.github.com/fr/actions/learn-github-actions/understanding-github-actions)
   > - [Setting Up Secrets in GitHub](https://docs.github.com/fr/actions/security-guides/using-secrets-in-github-actions)