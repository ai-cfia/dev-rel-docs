# Bytebase Guide

This document serves as a comprehensive reference for best practices and
standards to be followed by our AI-Lab team. Our goal is to establish
consistency, efficiency, and quality in all aspects of our development
processes.

Please also refer to the [Database Change
Management](https://github.com/ai-cfia/dev-rel-docs/blob/main/adr/006-database-change-management.md)

## Link

Bytebase:
[https://bytebase.inspection.alpha.canada.ca/](https://bytebase.inspection.alpha.canada.ca/)

## User

### First time user

*If we are using the Enterprise version, you should be able to create your own
account and skip these steps*

1. Retrieve your credentials with the DevOps team

2. Log into the tool and clic on your Account/Profil at the top right corner

3. Clic edit then enter your password (Weird UI, we know)

## Project

### New project

* Project Name: The name of the github repo associated with this project db
  *EG:* ```nachet-datastore```

* Key: Simply your project name *EG:*```Nachet```

## Database

### New DB

In the main page of bytebase there are 2 options:

* `New DB`

New DB will create a Database within your instance. This is not something you
should really be doing. However, refer to the [naming
convention](https://github.com/ai-cfia/dev-rel-docs/blob/main/adr/008-naming-convention.md) for your database name

* `+Add Instance`

This allows you to create a connection with a database server and import the
databases.

## Issues

Issues on bytebase are like github commits for a database. Therefore, keep the
naming consise and representative of the changes.

Like stated in the ADR we are using a semantic versioning of schema names to
maintain version control. Most changes should come through the Gitops pipeline,
however as a dev you might need to test around and do multiple small changes
which will create issues.

## Gitops

* SQL Review Workflow:

    The SQL Github workflow is a great tool to apply our established review
    policies. However, it wont flag fundamental SQL errors within the logic of
    the statement.

* Gitops migration pipeline

    This features will hook a project to any specified git repo on a specified
    branch. Once hooked, all new .SQL file committed to that branch will be
    processed and a migration script will be written and rollout on the database

```mermaid
sequenceDiagram

actor User
participant Github
participant Bytebase
participant Database

User -) Github: Commit a new SQL file
Github ->> Bytebase: API call for SQL Review Policy
alt has policy errors/warnings
    Github ->> User: Flag errors/Warnings
else
    Bytebase -) Bytebase: Create related Issue with <br> Migration scripts
    Bytebase ->> Database: Rollout changes
    User -->> Bytebase: Confirm database changes
    alt has errors
        Database ->> Bytebase: Rollout errors
        User -) Bytebase: Edit SQL changes
        User -) Bytebase: Rollout
        Bytebase ->> Database: Rollout changes
    end
end

```

### Configure GitOps workflow

1. On your Bytebase project configure GitOps; Login with your organization
   Github and select your desired repository.

2. Specify the branch that should be hooked with this project and the directory
   in which you will store the .SQL files. EG: `datastore/db/bytebase`

### Use GitOps Workflow

1. Manually create a new schema on the database (Creating a schema on this
   workflow seems to be not working properly at the moment of writing this
   document)

2. In you PR, create a new SQL file representing your new schema

3. The default file name is `<version>_<description>.sql` such as
   `202401010000_create_hello_table.sql`. The migration version,
   ``202401010000``, dictates the sequence of changes. The version must be
   **unique** and contains **only numeric characters**

4. The file must be a runnable script; EG:

    ```SQL

    --Schema creation "<schema_name>"
    DO
    $do$
    BEGIN
    IF (EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name = '<<>>')) THEN
    -- your Schema DDL
    ...
    -- your Schema default data (DML)
    ...
    END
    $do$;

    ```

5. Merge your PR on the specified branch for your GitOps (default should be
   `/main`)

6. To verify the rollout of your schema, go to the Bytebase interface and check
   under the Issues of your project. If there was a problem an issue is open,
   there might be some SQL Exceptions in your scripts (which it should of been
   tested before hand), Go fix them and roll-out manually. **If all went well**,
   You can see in the ``Change Activity`` there as been a rollout performed. You
   can also go on the DB of your project and check if the Version field match
   the version of your `<version>_<description>.sql` file.
