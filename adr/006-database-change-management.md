# ADR 6: How we manage changes in databases

## Executive Summary

This ADR details our thought process regarding our database management system
and highlights the factors influencing this choice. We considered a few solutions
before coming to a combination of different options.

Our solution is to incorporate semantic versioning information into schema names
to maintain version control as well as to clone the current schema to migrate
and transform data in a new schema implementing changes. This ensure data
integrity as well as good change management.

## Context
CFIA projects Finesse and Louis Chat depend heavily on the PostgreSQL database.
Changes to the database schema need to follow changes to the code as we
introduce new features. 

When deploying, we need to be able to:

* Deploy known set of changes associated with the version of the backend we want
  to deploy.
* Verify changes are correctly applied by running a test suite (probably backend
  test suite as it relates to the database).
* Revert changes if necessary (or switch back to an older version of the
  database).

## Decision

To address the context and requirements, the following approach is proposed:

- Incorporate semantic versioning information into schema names to maintain
  version control.
- Clone the current schema to create a new schema focusing on changes.
- Implement changes within the new schema, including columns, indexes, foreign
  keys, constraints, and functions.
- Migrate and transform data from the old schema to the new schema.
- Utilize the new schema either by renaming the current schema to the version
  name and renaming the new schema as the current schema, or by adjusting the
  search path to access the new schema and public schema.

Our decision to adopt this approach was influenced by a combination of multiple
solutions considered, including : Manual SQL Scripts, Database Migration Tools,
Blue-Green Deployment, and the concept of Database Views and Abstraction Layers.

## Solutions Considered

### Alternative 1 : Manual SQL Scripts
#### Pros : 
- Full control.
- No dependencies on third-party tools.
#### Cons: 
- Prone to human error.
- Time-consuming.
- Complex changes can be challenging.

### Alternative 2 : Database Migration Tools
#### Pros : 
- Version control for database schema.
- Controlled application of changes.
- Support for multiple database systems.
#### Cons: 
- Learning curve for tools.
- Added dependency on migration tool.

### Alternative 3 : Change Management Systems
#### Pros : 
- Structured and formalized approach.
- Enforces approvals and documentation.
#### Cons: 
- Slower process.
- Can be rigid and bureaucratic.

### Alternative 4 : Database as Code
#### Pros: 
- Infrastructure-as-Code (IaC) principles.
- Easy integration with DevOps practices.
- Consistent versioning.
#### Cons: 
- Learning curve for IaC tools.
- Potential for infrastructure and database code to diverge.

### Alternative 5 : Blue-Green Deployment
#### Pros:
- Minimizes downtime.
- Easy rollback.
- Isolated testing of new schema.
#### Cons: 
- Requires additional infrastructure.
- May lead to data synchronization challenges.

### Alternative 6 : Feature Flags
#### Pros: 
- Gradual and selective introduction of changes.
- Easy rollbacks.
#### Cons: 
- Requires additional feature flag management.
- Potential complexity in codebase.

### Alternative 7 : Database Views and Abstraction Layers
#### Pros: 
- Provides backward compatibility.
- Eases schema changes for applications.
#### Cons*:
- May not suit all use cases.
- Additional complexity in database design.

### Alternative 8 : Data Virtualization
#### Pros*: 
- Presents a consistent virtual schema.
- Allows physical schema changes.
#### Cons*: 
- Additional layer of complexity.
- Potential performance overhead.

### Alternative 9 : Continuous Integration/Continuous Deployment (CI/CD)
#### Pros*: 
- Automated changes within CI/CD pipeline.
- Data integrity testing.
#### Cons*: 
- Requires careful testing.
- Potential for data integrity issues if not managed correctly.

### Alternative 10 : Cloud Database Services
#### Pros*: 
- Automated schema management, scaling, and backups.
#### Cons*: 
- Vendor lock-in.
- Limited control over infrastructure.

## Consequences

The adoption of the proposed approach to manage database changes brings about
several considerations and challenges:

- The incorporation of semantic versioning into schema names, while aiding
  version identification, may introduce complexity in schema naming conventions,
  which can be prone to errors.

- Cloning the current schema for implementing changes increases storage
  requirements and can lead to redundancy in data storage.

- The use of multiple solutions, while providing flexibility, requires a higher
  level of expertise and introduces complexity in the database management
  process. It necessitates that the team be well-versed in various methods,
  which can lead to increased training and onboarding efforts.

- The comprehensive approach can also lead to decision fatigue when choosing the
  most suitable method for a given situation, potentially slowing down the
  decision-making process.

This approach is selected to balance version control, data integrity, and
flexibility. However, it's important to be mindful of the associated
complexities and potential challenges.



## References
