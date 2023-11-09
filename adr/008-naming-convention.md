# ADR-008 : Naming Convention for AI Lab

## Executive Summary

The decision to establish a Naming Convention for the Artificial Intelligence
(AI) Lab aims to bring clarity and consistency to the lab's internal structure.
The convention covers components, software applications, hardware equipment,
datasets, research projects, environments, and containers. By adopting this
standardized approach, the AI Lab intends to enhance communication,
documentation, and overall organization, facilitating seamless collaboration
among researchers, developers, and stakeholders. This decision aligns with the
lab's commitment to efficient and structured practices in artificial
intelligence research and development.

## Context

The establishment of a Naming Convention for the Artificial Intelligence (AI)
Lab is prompted by the imperative to introduce coherence and uniformity in the
lab's internal organizational framework. This initiative is undertaken to foster
clarity and efficiency in communication, documentation, and the overall
structuring of resources within the AI Lab. The context sets the stage for the
need to streamline nomenclature, facilitating seamless collaboration among
researchers, developers.

## Decision

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
- **Convention**: Start with the uppercase repository name, followed by the
  actual variable name, separating words with underscores.
- **Example**: `PROJECT_NAME_MY_ENV_VAR`

### Azure resource groups
- **Convention**: Start with `rg-` followed by the name in lowercase, separating
  words with dashes.
- **Example**: `rg-resource-group`

### Azure resources
- **Convention**: Use lowercase and separate words with dashes. Include the
  project name and type of resource.
- **Example**: `$(PROJECT_NAME)-storage-account`. So for `PROJECT_NAME=nachet`,
  use `nachet-storage-account`.

### SQL Files
- **Convention**: Use prefix with date format YYYY-mm-dd followed by a
  description of the script.
- **Example**: `2023-09-24-description-of-script.sql`

### Databaser Server / Cluster 
- **Convention**: Start with `cfia-` followed by the name in lowercase,
  separating words with dashes.
- **Example**: `cfia-name`

### Database
- **Convention**: Use in lowercase, don't use space.
- **Example**: `databasefullname`

### Database Schema
- **Convention**: Start with `name_v` where name is the Schema name, followed by
  the current version numbers.
- **Example**: `name_v1.0.0`

 ### Database Table and View
- **Convention**: Use lowercase and separate words with underscore.
- **Example**: `my_table_name`
- **Example**: `my_view_name`

## Notes
- These naming conventions should be followed for all new resources that can be
  accessed or manipulated via CLI.
- Existing resources that do not conform to these conventions should be
  refactored to match them.

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
within the AI Lab, making it easier for researchers, developers, and other to
understand and work with the various components and resources. It promotes
consistency and clarity in communication and documentation.
