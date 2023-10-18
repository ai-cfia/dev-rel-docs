# ADR 6: How we manage changes in databases

## Executive Summary

*This ADR details our thought process regarding our database managment system and highlights the factors influencing this choice. We considerd a few solutions before coming to a combination of different options.*

*Our solution is to incorporate semantic versioning information into schema names to maintain version control as well as to clone the current schema to migrate and transform data in a new schema implementings changes. This ensure data integrity as well as good changes managment.*

## Context: 
CFIA projects Finesse and Louis Chat depend heavily on the PostgreSQL database. Changes to the database schema need to follow changes to the code as we introduce new features. 

When deploying, we need to be able to:

* Deploy known set of changes associated with the version of the backend we want to deploy.
* verify changes are correctly applied by running a test suite (probably backend test suite as it relates to the database).
* revert changes if necessary (or switch back to an older version of the database).

## Decision:

To address the context and requirements, the following approach is proposed:

- Incorporate semantic versioning information into schema names to maintain version control.
- Clone the current schema to create a new schema focusing on changes.
- Implement changes within the new schema, including columns, indexes, foreign keys, constraints, and functions.
- Migrate and transform data from the old schema to the new schema.
- Utilize the new schema either by renaming the current schema to the version name and renaming the new schema as the current schema, or by adjusting the search path to access the new schema and public schema.

Our decision to adopt this approach was influenced by a combination of multiple solutions considered, including : Manual SQL Scripts, Database Migration Tools, Blue-Green Deployment, and the concept of Database Views and Abstraction Layers.

## Solutions Considered

1. **Manual SQL Scripts**:
   - *Pros*: Full control, no dependencies on third-party tools.
   - *Cons*: Prone to human error, time-consuming, complex changes can be challenging.

2. **Database Migration Tools**:
   - *Pros*: Version control for database schema, controlled application of changes, support for multiple database systems.
   - *Cons*: Learning curve for tools, added dependency on migration tool.

3. **Change Management Systems**:
   - *Pros*: Structured and formalized approach, enforces approvals and documentation.
   - *Cons*: Slower process, can be rigid and bureaucratic.

4. **Database as Code**:
   - *Pros*: Infra-as-Code (IaC) principles, easy integration with DevOps practices, consistent versioning.
   - *Cons*: Learning curve for IaC tools, potential for infrastructure and database code to diverge.

5. **Blue-Green Deployment**:
   - *Pros*: Minimizes downtime, easy rollback, isolated testing of new schema.
   - *Cons*: Requires additional infrastructure, may lead to data synchronization challenges.

6. **Feature Flags**:
   - *Pros*: Gradual and selective introduction of changes, easy rollbacks.
   - *Cons*: Requires additional feature flag management, potential complexity in codebase.

7. **Database Views and Abstraction Layers**:
   - *Pros*: Provides backward compatibility, eases schema changes for applications.
   - *Cons*: May not suit all use cases, additional complexity in database design.

8. **Data Virtualization**:
    - *Pros*: Presents a consistent virtual schema, allows physical schema changes.
    - *Cons*: Additional layer of complexity, potential performance overhead.

9. **Continuous Integration/Continuous Deployment (CI/CD)**:
    - *Pros*: Automated changes within CI/CD pipeline, data integrity testing.
    - *Cons*: Requires careful testing, potential for data integrity issues if not managed correctly.

10. **Cloud Database Services**:
    - *Pros*: Automated schema management, scaling, and backups.
    - *Cons*: Vendor lock-in, limited control over infrastructure.

## Consequences:

[The consequences of the decision go here.]
