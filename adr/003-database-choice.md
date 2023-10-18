# ADR 3: Adopting PostgreSQL as the Database System

## Abstract

*This ADR details our thought process regarding a database system's choice and highlights the factors influencing this choice. We considerd both MySQL and PostgreSQL, ultimately opting for PostgreSQL because of its robust features, scalability, and suitability for our specific needs.*

## Context: 
Today, effective data management is crucial to CFIA's AI Lab as we manage enormous amounts of information, requiring a database management system (DBMS). This choice is vital to ensure the security of sensitive data, offer high performance and scalability, support data analysis,facilitate collaboration between teams, and reduce operational costs.

## Solutions considered:
### PostgreSQL:
#### Pros:
PostgreSQL stands out as a great DBMS solution that offers traditional database benefits with an emphasis on reliability and maturity. Notably, it's also available as a Database-as-a-Service in Azure. Here are some key advantages of PostgreSQL:

- **Data Integrity:** enforces data integrity constraints, guarantee accuracy and consistency of data.
- **Scalability:** Suitable for both our current small-scale requirements and future expansion with thousands of users.
- **Indexing:** Wide array of indexing methods, enhancing the efficiency of data queries and application performance.
- **Open Source and Community Support:** Open-source nature and big community ensure regular updates, bug fixes, and a lot of extensions and plugins.
- **Security Features:** Role-based access control, SSL/TLS support, and data encryption.
- **Reliability:** Renowned for its reliability and stability.

#### Cons:

- **Complex Configuration:** Complex to configure and optimize, especially for users with limited database administration experience.
- **Performance Tuning:** Default configuration might not be ideal for all use cases.
- **Learning Curve:** Steeper learning curve for beginners compared to some other database systems due to its feature-rich and extensible nature.

## Decision:
We decided to adopt PostgreSQL as our DBMS for its scalability, the strength of its open-source community, and its reliable data integrity.

## Consequences: 
The adoption of PostgreSQL will facilitate data integrity, elevate reliability, offer the flexibility to adapt to evolving needs, and accommodate future growth. It also grants us access to an active community. However, it will require some investment in training and infrastructure setup to maximize the benefits of PostgreSQL for our projects.

## References:

- [Postgres pgvector Extension - Vector Database with PostgreSQL / Langchain Integration](https://youtu.be/FDBnyJu_Ndg?si=sBfBluS3G2TlW6RN) - BugBytes
- [PostgreSQL: The World's Most Advanced Open Source Relational Database](https://www.postgresql.org/) - postgresql.org