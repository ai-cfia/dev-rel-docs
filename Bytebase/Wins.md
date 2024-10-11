# Bytebase Wins

## Built in SQL Editor

One of the biggest win behind implementing Bytebase was the built-in SQL editor.
We do not technically have access to SQL editor tools such as DBeaver. Also
while being on the work network (VPN or in-office) it is **impossible** to
establish a connection to a Database port under IT's restriction. Even the FSDH
DB server is not reachable.

Therefore, having a built-in SQL editor that is hosted on our cluster (which is
not on the same network and does not have the same restriction) allow us to
establish connection to the database. This allows devs to maintain the DB from
anywwhere at anytime, which was not previously the case when working in the
office and lead to delays in performing our tasks.

## GitHub-like Features

* Groups & Roles: Organize team members into groups and assign roles for
  efficient collaboration.
* Projects, Branches & Issues: Manage projects, branches, and track issues
  similar to GitHub.
* **Approval and Reviews on Issues ($)**: Facilitate approval workflows and
  conduct reviews on issues.
* **SQL Review via GitHub Action**: Utilize GitHub Actions for SQL review
  processes.
* **External Secret Manager ($)**: Integration with external secret management
  systems.
* **Anomaly Detection ($)**: Detect anomalies within the database for enhanced
  security.

### Pipeline Integration with GitHub Repo/Branch

* Automatic Database Update: Trigger pipeline updates upon merges in specified
  GitHub repositories or branches.
* **Schema Path Template ($)**: Automatically update schema paths relative to
  the base directory in corresponding branches.
* **Customizable SQL Lint Rules ($)**: Tailor SQL linting rules to suit project
  requirements.

## Environment Management

* **Environment Tiers ($)**: Define environment tiers to manage deployment
  stages effectively.
* Test & Production Environments: Offer dedicated environments for testing and
  production.
* Pipeline for Environment Updates: Automate environment updates using a
  dedicated pipeline.
* **Rollout Policies ($)**: Implement policies requiring dedicated roles for
  change approvals.

## GUI

* Schema Edit Interface: Intuitive interface for editing database schemas.
* SQL Editor with Data Protection: Secure SQL editor with built-in data
  protection features.
* Support for Massive Data Queries: Handle large data queries efficiently.

## AI Augmentation

* Utilize AI for enhanced database management capabilities. This is not
  currently used nor explored.

## Support

* Dedicated Slack Channel, CSM, and SLA: Access dedicated support channels,
  customer success managers, and service level agreements.
* Roadmap Prioritization: Influence product roadmap through prioritization
  mechanisms.

## Security

* **SSO ($)**: Single Sign-On integration for enhanced authentication.
* **2FA ($)**: Two-Factor Authentication for additional security layers.
* **SSH Tunnel ($)**: Secure database connections via SSH tunneling.
* **Backup Policy ($)**: Define backup policies to ensure data resilience.
* **Disallow Signup ($)**: Restrict unauthorized signups for improved access
  control.
* **Read-Only Connection ($)**: Enable read-only connections for specific users
  or roles.
* **Data Access Control ($)**: Control access to sensitive data through
  fine-grained permissions.
* **Sensitive Data Management ($)**: Implement measures for managing sensitive
  data securely.

## [Bytebase Subscription](https://bytebase.inspection.alpha.canada.ca/setting/subscription)
