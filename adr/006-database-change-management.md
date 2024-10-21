# ADR-006: How we manage changes in databases

## Executive Summary

This Architecture Decision Record (ADR) details our thought process regarding
our database management system and highlights the factors influencing this
choice. We considered a few solutions before coming to a combination of
different options.

Our solution is to incorporate semantic versioning information into schema names
to maintain version control as well as to clone the current schema to migrate
and transform data in a new schema implementing changes. This ensure data
integrity as well as good change management.

## Context

CFIA products Finesse, Louis Chat and Nachet depend heavily on the PostgreSQL
database. Changes to the database schema need to follow changes to the code as
we introduce new features.

When deploying, we need to be able to:

* Deploy known set of changes associated with the version of the backend we want
  to deploy.
* Verify changes are correctly applied by running a test suite (probably backend
  test suite as it relates to the database).
* Revert changes if necessary (or switch back to an older version of the
  database).

## Decision

To address the context and requirements, the following approach is adopted:

* Incorporate semantic versioning information into schema names to maintain
  version control. Semantic Versioning helps developers and users understand the
  nature of the changes in a new version of a software package, making it easier
  to manage dependencies and assess compatibility. It usually is in this format
  : x.x.x (MAJOR.MINOR.PATCH) with each x being a number. ([PostgreSQL wiki,
  n.d.](#changes))

  In our case, we use louis_x.x.x - a MAJOR release would break the database, it
  includes modifying existing tables. MINOR release would not break anything
  major but will add tables for example. PATCH is just minor modifications that
  shouldn't be noticeable to users of the database.
* Clone the current schema to create a new schema focusing on changes.
* Implement changes within the new schema, including columns, indexes, foreign
  keys, constraints, and functions.
* Migrate and transform data from the old schema to the new schema.
* Utilize the new schema either by renaming the current schema to the version
  name and renaming the new schema as the current schema, or by adjusting the
  search path to access the new schema and public schema.

If we need to revert changes, we can simply point towards the older version of
the schema thanks to the semantic versionning. We are currently thinking about
using a tool to automate this process.

Our decision to adopt this approach was influenced by a combination of multiple
solutions considered, including : Manual SQL Scripts, Database Migration Tools,
Blue-Green Deployment, and the concept of Database Views and Abstraction Layers.

## Solutions Considered

### Alternative 1 : Manual SQL Scripts

Pros:

* Full control.

* No dependencies on third-party tools.

Cons:

* Prone to human error.

* Time-consuming.
* Complex changes can be challenging.

### Alternative 2 : Database Migration Tools

Pros:

* Version control for database schema.

* Controlled application of changes.
* Support for multiple database systems.

Cons:

* Learning curve for tools.

* Added dependency on migration tool.

### Alternative 3 : Change Management Systems

Pros:

* Structured and formalized approach.

* Enforces approvals and documentation.

Cons:

* Slower process.

* Can be rigid and bureaucratic.

### Alternative 4 : Database as Code

Pros:

* Infrastructure-as-Code (IaC) principles.

* Easy integration with DevOps practices.
* Consistent versioning.

Cons:

* Learning curve for IaC tools.

* Potential for infrastructure and database code to diverge.

### Alternative 5 : Blue-Green Deployment

Pros:

* Minimizes downtime.

* Easy rollback.
* Isolated testing of new schema.

Cons:

* Requires additional infrastructure.

* May lead to data synchronization challenges.

### Alternative 6 : Feature Flags

Pros:

* Gradual and selective introduction of changes.

* Easy rollbacks.

Cons:

* Requires additional feature flag management.

* Potential complexity in codebase.

### Alternative 7 : Database Views and Abstraction Layers

Pros:

* Provides backward compatibility.

* Eases schema changes for applications.

Cons:

* May not suit all use cases.

* Additional complexity in database design.

### Alternative 8 : Data Virtualization

Pros:

* Presents a consistent virtual schema.

* Allows physical schema changes.

Cons:

* Additional layer of complexity.

* Potential performance overhead.

### Alternative 9 : Continuous Integration/Continuous Deployment (CI/CD)

Pros:

* Automated changes within CI/CD pipeline.

* Data integrity testing.

Cons:

* Requires careful testing.

* Potential for data integrity issues if not managed correctly.

### Alternative 10 : Cloud Database Services

Pros:

* Automated schema management, scaling, and backups.

Cons:

* Vendor lock-in.

* Limited control over infrastructure.

## Consequences

The adoption of the proposed approach to manage database changes brings about
several considerations and challenges:

* The incorporation of semantic versioning into schema names, while aiding
  version identification, may introduce complexity in schema naming conventions,
  which can be prone to errors.
  * Mitigation: To prevent this, we can implement clear and standardized naming
    conventions and provide documentation to ensure team members understand and
    follow the conventions consistently.

* Cloning the current schema for implementing changes increases storage
  requirements and can lead to redundancy in data storage.
  * Mitigation: Keeping an eye on storage use and tidy up data to reduce
    duplication and control data growth should resolve this issue.

* The use of multiple solutions, while providing flexibility, requires a higher
  level of expertise and introduces complexity in the database management
  process. It necessitates that the team be well-versed in various methods,
  which can lead to increased training and onboarding efforts.
  * Mitigation: We will provide training and onboarding for the team to make
    sure they can use different methods effectively. Create clear best practices
    and guidelines for choosing solutions.

* The comprehensive approach can also lead to decision fatigue when choosing the
  most suitable method for a given situation, potentially slowing down the
  decision-making process.
  * Mitigation: We created ADRs for this specific reason.

This approach is selected to balance version control, data integrity, and
flexibility. However, it's important to be mindful of the associated
complexities and potential challenges.

## References

### Changes

Change management tools and techniques. Change management tools and techniques -
PostgreSQL wiki. (n.d.).
<https://wiki.postgresql.org/wiki/Change_management_tools_and_techniques>
