# ADR-006: How we managed changes in databases

## Executive Summary

This Architecture Decision Record (ADR) details our thought process regarding
our database management system and highlights the factors influencing this
revisited choice. We applied few solutions in the past, however they seem to not
be the most effective and our choice is being revisited.

**Our solution is to incorporate semantic versioning information into schema
names to maintain version control as well as to clone the current schema to
migrate and transform data in a new schema implementing changes. This ensure
data integrity as well as good change management.**

## Context

CFIA products Finesse, Louis Chat, Nachet and FertiScan depend heavily on the
PostgreSQL database. Changes to the database schema need to follow changes to
the code as we introduce new features.

When deploying, we need to be able to:

* Deploy known set of changes associated with the version of the backend we want
  to deploy.
* Verify changes are correctly applied by running a test suite
* Revert changes if necessary (or switch back to an older version of the
  database).
* Have an approval change management process in place to control database
  changes.
* Use a separate environment for testing and development. (It prevents errors,
  isolate changes that could impact production and helps resolves issues)

We adopted a decision in the past to incorporate semantic versioning. This
decision will still stand, however we are going to improve it.

We also need to be able to maintain and edit the database content. At the
current time, it is not possible to establish Database connection under the
network regulations. This should also be considered when making the decision if
a tool offers a solution to this problem.

## Previous Decision

To address the context and requirements, the following approach is adopted:

* Incorporate semantic versioning information into schema names to maintain
  version control. Semantic Versioning helps developers and users understand the
  nature of the changes in a new version of a software package, making it easier
  to manage dependencies and assess compatibility. It usually is in this format
  : x.x.x (MAJOR.MINOR.PATCH) with each x being a number. ([PostgreSQL wiki,
  n.d.](https://wiki.postgresql.org/wiki/Change_management_tools_and_techniques))

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

## New Decision

Based on the previous decision, we went ahead and decided it would be best to
have a tool that would manage database versionning. We then went ahead and
inspected alot of products.

### Considered versionning management tools

#### Bytebase

Pros:

* Offers a GUI (usefull for unexperienced devs)

* Enables version management just like Github (branches, issues) and also
    allow to see previous changes

* Offers a built-in SQL Editor

* Allow for multi-tier environment

* Is open source and can self-hosted

* Offers customizable workflow to verify the changes (GitOps)

Cons:

* Some features are hiddent behind a pay wall (most of those features dont
    seem to be necessary atm)

* Still in an early development phase

#### Liquipedia

Pros:

* Offers a log features to track all changes

* Is open source

* Offers customizable workflow to verify the changes (GitOps)

Cons:

* Only offers Command-line (No GUI)

* No built-in SQL editor

* No multi-tier environment

* features behind a pay wall

#### Flyway

Pros:

* Offers a GUI (usefull for unexperienced devs)

* Open source

* Offers a Cl/CD workflow (not a GitOps one)

Cons:

* Does not support Azure PostgreSQL instance

* Most features are hidden behind a paywall

* No SQL editor

## Improvement

Building upon the previous decision, we aim to enhance our database change
management process by incorporating a self-hosted instance of **Bytebase**. This
improvement will streamline the management of database schema changes and
provide additional features for collaboration and automation.

We also chose Bytebase as a solution because it fits the open view of the agency
and also mimic and integrates perfectly our current workflow that is centralized
on github.

### Key Enhancements

1. **Integration with Bytebase**:

   * Integrate Bytebase into our database change management workflow to
     centralize and automate the tracking of schema changes. Bytebase provides
     features such as version control, schema diff, and issue tracking, which
     will enhance our ability to manage database changes effectively.

2. **Automation of Change Management**:

   * Leverage Bytebase's automation capabilities to automate repetitive tasks
     involved in schema changes, such as generating SQL scripts, reviewing
     changes, and deploying updates. This automation will reduce manual effort,
     minimize the risk of errors, and improve the efficiency of our change
     management process.

3. **Enhanced Collaboration**:

   * Utilize Bytebase's collaboration features to facilitate communication and
     coordination among team members involved in database changes. With
     Bytebase, team members can collaborate on change requests, discuss
     implementation details, and track the status of changes in a centralized
     platform, enhancing transparency and collaboration.

4. **Improved Auditing and Compliance**:

   * Take advantage of Bytebase's audit trail and logging capabilities to
     maintain a comprehensive record of all database changes, including who made
     the changes, when they were made, and the reasons for the changes. This
     enhanced auditing capability will ensure compliance with regulatory
     requirements and facilitate post-change analysis and troubleshooting.

5. **Approval Change Management Process**:

   * Implement an approval change management process within Bytebase to control
     and track database changes. This process will require changes to be
     reviewed and approved by designated stakeholders before being deployed,
     ensuring that only authorized changes are applied to the database.

6. **Separate Environment for Testing and Development**:

   * Utilize Bytebase's support for separate environments to establish dedicated
     cloud based environments for testing and development. By isolating changes
     in these environments, we can prevent errors, identify potential issues
     early in the development cycle, and ensure that changes are thoroughly
     tested before being deployed to production.

By implementing these enhancements through the adoption of Bytebase, we aim to
improve the efficiency, reliability, and transparency of our database change
management process, ultimately leading to a more robust and resilient system.

## Consequences

The adoption of the proposed approach to manage database changes brings about
several considerations and challenges:

## Consequences of Implementing the Bytebase Solution

Implementing the Bytebase solution for database change management will bring
about several consequences, both positive and potentially challenging, that need
to be considered:

### Positive Consequences

1. **Streamlined Change Management**:
   * By integrating Bytebase into our workflow, we can streamline our change
     management process, automating repetitive tasks and centralizing the
     tracking of schema changes. This will lead to increased efficiency and
     productivity, as well as reduced manual effort.

2. **Enhanced Collaboration and Communication**:
   * Bytebase's collaboration features will facilitate better communication and
     coordination among team members involved in database changes. With a
     centralized platform for discussing change requests and tracking their
     status, collaboration will be more transparent and effective.

3. **Improved Compliance and Auditing**:
   * With Bytebase's audit trail and logging capabilities, we can maintain a
     comprehensive record of all database changes, ensuring compliance with
     regulatory requirements and facilitating post*change analysis and
     troubleshooting.

4. **Greater Control and Visibility**:
   * The approval change management process within Bytebase will provide greater
     control over database changes, requiring review and approval by designated
     stakeholders. This will enhance accountability and ensure that only
     authorized changes are deployed to production.

5. **Reduced Risk of Errors**:
   * By utilizing separate environments for testing and development, we can
     identify and resolve potential issues early in the development cycle,
     reducing the risk of errors and ensuring that changes are thoroughly tested
     before being deployed to production.

6. **Centralization of Database Changes**:
   * By centralizing all database changes within Bytebase, we create a single
     source of truth for tracking and managing schema modifications. This
     centralization simplifies the process of monitoring and reviewing changes,
     leading to improved visibility and control over our database
     infrastructure.

### Potential Challenges

1. **Adoption and Training**:

   * Introducing a new tool like Bytebase may require training for team members
     to familiarize themselves with its features and functionalities. Ensuring
     successful adoption will be essential for realizing the full benefits of
     the solution.

2. **Integration Complexity**:

   * Integrating Bytebase into our existing workflow and infrastructure may
     present technical challenges and require adjustments to our processes. It's
     important to carefully plan and execute the integration to minimize
     disruption.

3. **Data Security and Privacy**:

   * Storing sensitive database information in Bytebase raises concerns about
     data security and privacy. Implementing robust security measures and
     ensuring compliance with data protection regulations will be essential to
     safeguarding our data.

By considering these consequences and proactively addressing potential
challenges, we can effectively leverage the Bytebase solution to enhance our
database change management process and drive improvements in our overall system
reliability and efficiency.

This approach is selected to balance version control, data integrity, and
flexibility. However, it's important to be mindful of the associated
complexities and potential challenges.

## References

* Change management tools and techniques. Change management tools and techniques
  - PostgreSQL wiki. (n.d.).
  <https://wiki.postgresql.org/wiki/Change_management_tools_and_techniques>
