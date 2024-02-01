# Github

## Executive summary

AI Lab is adopting an OpenSource, OpenData, OpenModel approach and Github is the
best platform to create collaboration with our internal and external partners to
develop new products that have wide applicability and are deployable
cross-cloud.

These applications are developed and tested with publically available data (such
as the information published on our public website).

AI Lab Github repositories are all public and licensed under the MIT licenses.

Github provides generous free resources for opensource projects, allowing us to
stick to their [Github free for organizations
plan](https://docs.github.com/en/get-started/learning-about-github/githubs-plans#github-free-for-organizations)

- including 3,000 GitHub Actions minutes per month of Continuous Integration /
Continuous Deployment resources.

## Why Github?

- [ADR-004: Open Source
  Development](https://github.com/ai-cfia/dev-rel-docs/blob/main/adr/004-open-source-development.md)
- [ADR-007: Selecting GitHub as Code Hosting
  Platform](https://github.com/ai-cfia/dev-rel-docs/blob/redat97/issue51/adr/007-code-hosting-platform.md)

## Benefits

- [Automated code security and
  analysis](https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security)
  - One of the highest risk is pulling in a compromised external library into
    our infrastructure
  - This is not exclusive risk to Github; it's quite possible that a dependency
    installed in an app internally could pull in a compromised external
    dependency
  - Github code scanning also integrates with [Azure DevOps
    itself](https://learn.microsoft.com/en-us/azure/devops/repos/security/configure-github-advanced-security-features?view=azure-devops&tabs=yaml)
- [Github Actions](https://docs.github.com/en/actions): rich library of
  automated workflows, including AI bot reviews.
  - [Our Github workflows](https://github.com/ai-cfia/github-workflows/)
  - Already deploying to Google GCP (free credits), preparing to deploy to a
    free credits account on Azure
- [Github Codespaces](https://docs.github.com/en/codespaces/overview):
  development in a web browser in the cloud using the same Visual Studio Code
  environment we find on the desktop.
  - This allows our collaborators (most of whom are interns) to quick ramp up
    start developing, reducing the time to contribute from days to hours.
- [Github Copilot](https://github.com/features/copilot): AI-supported code
  writing improving developer productivity 10x to 100x

## Github and Security

- Multifactor authentication is required for all organization members
- Dependabot (dependency scanning and repos) has been enabled on all repos

## Audit based on Cloud Guard Rails

[GC Cloud Guardrails GitHub repository](https://github.com/canada-ca/cloud-guardrails)

### 01 Protect root / global admins account

### 02 Management of administrative privileges

### 03 Cloud console access

### 04 Enterprise monitoring accounts

### 05 Data location

### 06 Protection of data-at-rest

### 07 Protection of data-in-transit

### 08 Segment and separate

### 09 Network security services

### 10 Cyber defense services

### 11 Logging and monitoring

### 12 Configuration of cloud marketplaces

## Deployment

Steps:

- Our ongoing opensource products are being deployed to GCP
- Deploy to Azure free account
- Deploy to our Azure Sandbox (through artifact registry)
- Deploy to Azure

## Infrastructure-as-code

- [Infrastructure as code (IaC) as key to truly secure infrastructure
  #143](https://github.com/canada-ca/cloud-guardrails/issues/143)

## Integration steps

1. Billing

1. Deployment from Github to our Sandbox (and Artifacts registry)
