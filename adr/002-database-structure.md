# ADR 002: ADR on our choices of database structure

## CFIA AI Lab Database Organization
![AiLab-db](./002-database-structure-diagram.png)

## Executive Summary
This Architecture Decision Record (ADR) describes our plan to promote sharing data between software products created by the Canadian Food Inspection Agency (CFIA) Artificial Intelligence (AI) Lab. At the same time, we aim to make things more flexible and easier to maintain by bringing all our product databases together in a single database server.

## Context
Our previous ailab-db architecture required maintenance of several databases, notably "louis-db" and "nachet-db." Although this approach initially provides clarity, it ultimately results in redundancy, less flexibility, and collaboration issues, which may cause data conflicts. We have a better way to maintain databases with this approach, which uses a Consolidated Database Approach and only uses one database.

## Decision
We've decided to use a Consolidated Database Approach, which means we'll combine all our individual product databases into one central database server. This approach streamlines data management, reduces duplication, and makes it easier for teams to collaborate and share data efficiently. It's a choice that simplifies our database structure and enhances our overall data handling.

## Alternatives Considered

This section presents the different options or solutions considered before
arriving at the final decision. Each alternative is usually discussed in a
subsection.

### Separate Databases (Old Setup)

Pros:

- **Initial clarity:** The current setup offers initial clarity because each product or team has its own separate database. This can make it easier to understand which data belongs to which product or team.

Cons:

- **Redundancy:** Maintaining separate databases can lead to data redundancy. If the same data needs to be used across multiple products or teams, it may be duplicated in multiple databases, which can lead to inconsistencies and increased storage requirements.

- **Reduced flexibility:** Having separate databases for each product or team can reduce flexibility. If there is a need to share or integrate data across products or teams, it may require complex data synchronization processes.

- **Collaboration challenges:** Collaboration between different teams or products may be challenging with separate databases. It can be harder to share and access data seamlessly, leading to potential communication and coordination issues.

- **Potential data conflicts:** Separate databases may result in data conflicts, especially when different teams or products need to update the same data simultaneously. These conflicts can lead to data inconsistencies and errors.

In summary, while the "Separate Databases (Current Setup)" option provides initial clarity, it has serious disadvantages, such as redundancy, decreased flexibility, difficulties with collaboration, and the possibility of data conflicts. 

### Consolidated Database Approach

Pros:

- **Enhanced teamwork:** By using a single consolidated database, teams can collaborate more effectively. By having only database, sharing and accessing data becomes simpler, which can lead to improved cross-functional cooperation.

- **Elimination of repeated data:** This approach eliminates the need for redundant data. All information is stored in one place, reducing data duplication and ensuring data consistency. If I create a file in one database, I can access it in another without the need to recreate it.

- **Greater flexibility in product management:** A consolidated database provides greater flexibility in managing different products. It allows for efficient data sharing and integration between various teams or products, making it easier to adapt to changing requirements. By using a system of Python modules, we can just add what we need, and when we need it.

Cons:

- **Significant effort required to update files:** If you don't initaly have a consolidated database structure, transitioning involves renaming and moving files, which can be a labor-intensive process. It may require a substantial initial effort to reorganize and migrate data.

- **Development process complexity:** Adapting to the new database structure may introduce complexity to the development process. Teams may need to adjust their workflows and applications to accommodate the changes, potentially leading to temporary challenges. This required the team to have a good planning or prototype about schema and clear relationships between databases.

## Consequences:

### Positive Consequences:

- Collaboration will be better because teams will operate more smoothly and promote stronger cross-functional cooperation.
- By eliminating redundant data, the single database will produce information that is more accurate and dependable.

### Negative Consequences:

- Renaming and moving files will necessitate a significant initial effort.
- Adapting to the new structure may temporarily complicate the development process.
