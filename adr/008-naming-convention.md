# ADR-008 : Naming Conventions for AI Lab

## Executive Summary

The decision to establish a naming convention for the Artificial Intelligence
(AI) of the Canadian Food Inspection Agency (CFIA) Laboratory aims to bring
clarity and consistency to the lab's internal structure. The convention covers
components, software applications, hardware equipment, datasets, research
projects, environments, and containers. By adopting this standardized approach,
the AI Lab intends to enhance communication, documentation, and overall
organization, facilitating seamless collaboration among researchers, developers,
and stakeholders. This decision aligns with the lab's commitment to efficient
and structured practices in the field of applied AI.

## Context

The establishment of a Naming Convention for the Artificial Intelligence Lab is
prompted by the imperative to introduce coherence and uniformity in the lab's
internal organizational framework. This initiative is undertaken to foster
clarity and efficiency in communication, documentation, and the overall
structuring of resources within the AI Lab. The context sets the stage for the
need to streamline nomenclature, facilitating seamless collaboration among
researchers, developers.

## Decision

### GitHub repositories
- **Convention**: Use lowercase and separate words with dashes.
- **Example**: `my-repo-name`
- **Reference**:
  - [Tilburg. Best Practices for Naming Git Branches.](#ref-tilburg)
  - [Branching. Digitaljhelms.](#ref-digitaljhelms)


### Files
- **Convention**: Use lowercase and separate words with dashes.
- **Example**: `my-file.sh`

### Folders/directories
- **Convention**: Use lowercase and separate words with dashes.
- **Example**: `my-folder`

### Environment variables
- **Convention**: Start with the uppercase repository name, followed by the
  actual variable name, separating words with underscores.
- **Example**: `PROJECT_NAME_MY_ENV_VAR`
- **Exception**: In React project, the environment variables have to be prefixed
  with `REACT_APP`, so in this case we need to have this prefix
- **Example**: `REACT_APP_PROJECT_NAME_ENV_VAR`

### Project name
- **Standard Practice**: Our usual approach involves selecting a well-known
  figure associated with the project's theme.

### Azure resource groups
- **Convention**: End with `-rg` followed by the name in lowercase, separating
  words with dashes. `-rg` stand for `resource group`.
- **Example**: `resource-group-rg` **Reference**:
  - [Microsoft. Azure Naming Best Practices](#ref-microsoft-1)
  - [Microsoft. Azure Resource Abbreviations](#ref-microsoft-2)

### Azure resources
- **Convention**: Use lowercase and separate words with dashes. Include the
  project name and type of resource.
- **Example**: `$(PROJECT_NAME)-storage-account`. So for `PROJECT_NAME=nachet`,
  use `nachet-storage-account`.

### SQL Files
- **Convention**: Use prefix with date format yyyy-mm-dd followed by a
  description of the script.
- **Example**: `2023-09-24-description-of-script.sql`

### Database Server / Cluster
- **Convention**: The name should follow this pattern:
  `project-service-environment` all in lowercase, separating words with dashes.
- **Example**: `nachet-postgresql-dev`
- **Example**: `finesse-postgresql-prd`

### Database
- **Convention**: Use in lowercase, don't use space.
- **Example**: `databasefullname`

### Database Schema
- **Convention**: Start with `name_` where name is the Schema name, followed by
  the current version numbers.
- **Example**: `name_1.0.0`
- **Why**: We're adopting this format to adhere to the `semver` standard,
  enabling us to utilize tools across different languages for parsing versions
  effectively. For more information, you can check the ADR-006 about How we
  manage changes in databases.
- **Reference**:
  - [Semver.org, Semantic Versioning 2.0.0](#ref-semver)
  - [Pypi.org, semver](#ref-pypi)
  - [CFIA, ADR-006](#ref-adr-006)
  - [Ovid. Database Naming Standards](#ref-ovid)
  - [Rootsoft. Database Naming Convention](#ref-rootsoft)
  - [Vertabelo. Worst Database Naming Conventions](#ref-vertabelo)


 ### Database Table, Column and View
- **Convention**: Use lowercase and separate words with underscore. For naming
  use plural.
- **Why**: SQL reserved word are singular, so by using plural you're less likely
  to have a collision.
- **Example**: `my_table_name`,`my_column_name` `my_view_name`
- **Concrete example**: `html_contents`, `users`, `user_id`

### Abbreviation for Environment
- `dev`: development environment (typically ongoing development branches
  deployed for developer testing)
- `uat`: user-acceptance testing: new version that is shared to product
  management and champion users for testing before deployment to production
- `prd`: production: production version of the system

## Notes
- These naming conventions should be followed for all new resources that can be
  accessed or manipulated via CLI.
- Existing resources that do not conform to these conventions should be
  refactored to match them.
- Ensure that the names chosen align with the intended purpose or usage of the
  resource.

## Alternatives Considered

This section presents the different options or solutions considered before
arriving at the final decision.

### Alternative for naming Database

- **Alternative**: Adding `-db` to specify the type of the text.
- **Example**: `databasefullname-db`

Pros:

- Clearly indicates that it is a database, providing unambiguous identification
  even in the absence of context.

Cons:

- In common use, the nature as a database is already evident, rendering the
  additional specification unnecessary.

### Alternative for naming Table and View

- **Alternative**: Having hyphen "`-`" instead of  underscore "`_`" to write the
  table name.
- **Example**: `my-table-name`

Pros:

- The use of hyphens often enhances readability, especially in situations where
  table names may be composed of multiple words.
- We use hyphens for other naming conventions, adopting a uniform approach
  contributes to overall consistency.

Cons:

- Some systems or programming languages may have restrictions on the use of
  hyphens in identifiers, potentially causing compatibility issues.
- In environments where the convention is typically to use underscores, adopting
  hyphens may lead to confusion or inconsistency if not applied uniformly.

## Consequences

This naming convention will help create a standardized and organized structure
within the AI Lab, making it easier for researchers, developers, and others to
understand and work with the various components and resources. It promotes
consistency and clarity in communication and documentation.

## References
* How we manage changes in databases. (2023, November 6). CFIA AI-Lab.
  [github.com/ai-cfia/dev-rel-docs/](https://github.com/ai-cfia/dev-rel-docs/blob/main/adr/006-database-change-management.md)<a
  id="ref-adr-006"></a>
* Database Naming Standards. (2022, March 21). Ovid.
  [https://dev.to/ovid/database-naming-standards](https://dev.to/ovid/database-naming-standards-2061)<a
  id="ref-ovid"></a>
* Database Naming Convention. (2017, June 15). RootSoft.
  [https://github.com/RootSoft/Database-Naming-Convention](https://github.com/RootSoft/Database-Naming-Convention)<a
  id="ref-rootsoft"></a>
* Worst Database Naming Conventions. (2021, August 31). Vertabelo
  [https://vertabelo.com/blog/database-naming-convention](https://vertabelo.com/blog/database-naming-convention)<a
  id="ref-vertabelo"></a>
* Best Practices for Naming Git Branches. (n.d.). Tilburg Science Hub.
  [https://tilburgsciencehub.com/](https://tilburgsciencehub.com/topics/automation/version-control/advanced-git/naming-git-branches/)<a
  id="ref-tilburg"></a>
* Branching. (n.d.). Digitaljhelms.
  [https://gist.github.com/digitaljhelms/4287848](https://gist.github.com/digitaljhelms/4287848)<a
  id="ref-digitaljhelms"></a>
* Azure Naming Best Practices. (2023, March, 26). Microsoft.
  [https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)<a
  id="ref-microsoft-1"></a>
* Azure Resource Abbreviations. (2023, April 17). Microsoft.
  [https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)<a
  id="ref-microsoft-2"></a>
* Semantic Versioning 2.0.0 (n.d.). Semver.org.
  [https://semver.org/](https://semver.org/)<a id="ref-semver"></a>
* Semver 3.0.2 (2023, October 9). Pypi.org.
  [https://pypi.org/project/semver/](https://pypi.org/project/semver/)<a
  id="ref-pypi"></a>
