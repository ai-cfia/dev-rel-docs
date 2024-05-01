# ADR-002: Database Structure Design

## CFIA AI Lab Database Diagram

![The image is a visual representation of the Canadian Food Inspection Agency's
(CFIA) AI Lab Database Organization. It details how different front-end and
back-end systems are connected to their respective databases and a central
database. At the top of the image, there are four green rectangles representing
the front-end components of different applications: "louis-frontend",
"finesse-frontend", "nachet-frontend", and "new-product-frontend". Below these,
connected by arrows, are blue rectangles representing the corresponding back-end
components for each application: "louis-backend", "finesse-backend",
"nachet-backend", and "new-product-backend". At the center of the image is a
large orange rectangle labeled "ailab-db", indicating a central database. Within
this central database, there are four purple rectangles that represent
individual databases connected to their respective back-ends: "louis-db",
"finesse-db", "nachet-db", and "new-product-db". The diagram also includes two
email addresses at the bottom, presumably for contact purposes:
"cfia.ai-ia.acia@inspection.gc.ca" and "jolan.thomassin@inspection.gc.ca". There
is a date listed as well, "2023-10-11", which could signify the date of the
diagram's creation or the implementation of the database organization. In the
lower right corner, there is the logo of the Canadian Food Inspection Agency,
its French name "Agence canadienne d'inspection des aliments", and the Canadian
flag, which represents the national identity and authority of the agency. The
diagram likely serves as an internal document to help understand the structure
of the AI lab's databases and their
interconnections.](./002-database-structure-diagram-organization.png) ![The
image is a structured diagram titled "CFIA AI Lab Database Structure". It
depicts the organization of databases and schemas within the Canadian Food
Inspection Agency's AI Lab. At the top of the diagram is the main database
server, a green rectangle labeled "cfia-nosql (cluster / database server)",
indicating that it uses a NoSQL database architecture. Beneath it are three
green rectangles connected to the server, representing individual databases:
"finance (db)" on the left, "ailab (db)" in the middle, and "science (db)" on
the right. Further down, under the "ailab (db)" database, there are two
additional green rectangles, labeled "nachet_v1.0.0 (schema)" and "louis_v1.0.0
(schema)", suggesting these are specific schemas or structures within the AI Lab
database. Below the "nachet_v1.0.0 (schema)" there is another green rectangle
labeled "score (view)", indicating a database view, and under the "louis_v1.0.0
(schema)" are two rectangles: "html_content (table)" and "crawl (table)",
suggesting these are tables within the Louis schema. The diagram features the
same email addresses as the previous one: "cfia.ai-ia.acia@inspection.gc.ca" and
"jolan.thomassin@inspection.gc.ca". The date "2023-11-09" is also present,
indicating when the diagram was likely created or updated. In the bottom right
corner, there is the logo of the Canadian Food Inspection Agency, its French
name "Agence canadienne d'inspection des aliments", and the Canadian flag, which
signifies the national scope and authority of the
organization.](./002-database-structure-diagram.png)

## Executive Summary

This Architecture Decision Record (ADR) describes our plan to promote sharing
data between software products created by the Canadian Food Inspection Agency
(CFIA) Artificial Intelligence (AI) Lab. At the same time, we aim to make things
more flexible and easier to maintain by bringing all our product databases
together in a single database server.

## Context

The database was originally created for Louis, our conversational agent. Over
time, it expanded to include our public website's knowledge base and became
essential for products like Finesse (search). However, the name "ailab-db" no
longer accurately represents its broader scope.

Upon reflection, it's apparent that our database naming doesn't match its actual
functions. While maintaining separate Python packages per application from a
unified codebase has advantages, associating a schema with each app might not
effectively communicate the entities organized within.

## Terminology

**Database**: Database refers to a named collection of local SQL objects.

**Database Server**: A specialized server managing access to databases.

**Schema**: Serves as a namespace for SQL objects within a database, with each
object residing in one schema. More broadly, "schema" refers to all data
descriptions (table definitions, constraints, comments, etc.) for a database or
its subset.

## Decision

We've decided to use a Consolidated Database Approach, which means we'll combine
all our individual product databases into one central database server. This
approach streamlines data management, reduces duplication, and makes it easier
for teams to collaborate and share data efficiently. It's a choice that
simplifies our database structure and enhances our overall data handling.

## Alternatives Considered

This section presents the different options or solutions considered before
arriving at the final decision. Each alternative is usually discussed in a
subsection. You can have more details in the "References" section.

### Separate Databases (Old Setup)

Pros:

- **Initial clarity:** The current setup offers initial clarity because each
  product or team has its own separate database. This can make it easier to
  understand which data belongs to which product or team.

Cons:

- **Redundancy:** Maintaining separate databases can lead to data redundancy. If
  the same data needs to be used across multiple products or teams, it may be
  duplicated in multiple databases, which can lead to inconsistencies and
  increased storage requirements.

- **Reduced flexibility:** Having separate databases for each product or team
  can reduce flexibility. If there is a need to share or integrate data across
  products or teams, it may require complex data synchronization processes.

- **Collaboration challenges:** Collaboration between different teams or
  products may be challenging with separate databases. It can be harder to share
  and access data seamlessly, leading to potential communication and
  coordination issues.

- **Potential data conflicts:** Separate databases may result in data conflicts,
  especially when different teams or products need to update the same data
  simultaneously. These conflicts can lead to data inconsistencies and errors.
  [Toptal - Database Design Bad Practices](#toptal)

In summary, while the "Separate Databases (Current Setup)" option provides
initial clarity, it has serious disadvantages, such as redundancy, decreased
flexibility, difficulties with collaboration, and the possibility of data
conflicts.

### Consolidated Database Approach

Pros:

- **Enhanced teamwork:** By using a single consolidated database, teams can
  collaborate more effectively. By having only one database, sharing and
  accessing data becomes simpler, which can lead to improved cross-functional
  cooperation. [Budibase - How to Integrate Multiple Databases](#budibase)

- **Elimination of repeated data:** This approach eliminates the need for
  redundant data. All information is stored in one place, reducing data
  duplication and ensuring data consistency. If I create a file in one database,
  I can access it in another without the need to recreate it. [Matillion - What
  is Data Consolidation?](#matillion)

- **Greater flexibility in product management:** A consolidated database
  provides greater flexibility in managing different products. It allows for
  efficient data sharing and integration between various teams or products,
  making it easier to adapt to changing requirements. By using a system of
  Python modules, we can just add what we need, and when we need it.

Cons:

- **Significant effort required to update files:** If you don't initially have a
  consolidated database structure, transitioning involves renaming and moving
  files, which can be a labor-intensive process. It may require a substantial
  initial effort to reorganize and migrate data.

- **Development process complexity:** Adapting to the new database structure may
  introduce complexity to the development process. Teams may need to adjust
  their workflows and applications to accommodate the changes, potentially
  leading to temporary challenges. This required the team to have a good
  planning or prototype about schema and clear relationships between databases.

## Consequences

### Positive Consequences

- Collaboration will be better because teams will operate more smoothly and
  promote stronger cross-functional cooperation.
- By eliminating redundant data, the single database will produce information
  that is more accurate and dependable.

### Negative Consequences

- Renaming and moving files will necessitate a significant initial effort.
- Adapting to the new structure may temporarily complicate the development
  process.

### References

Any documentation, research, or data that support the decision can be cited
here. This can include academic papers, blog posts, or internal documents.

#### Toptal

Blog. (n.d.). Toptal. [Database Design Bad Practices](
https://www.toptal.com/database/database-design-bad-practices)

#### Budibase

Blog. (2022, Mai 22). Budibase. [How to Integrate Multiple Databases](
https://budibase.com/blog/data/how-to-integrate-multiple-databases)

#### Matillion

Blog. (2020, Décembre 16). Matillion. [What is Data Consolidation?,](
https://www.matillion.com/blog/what-is-data-consolidation)
