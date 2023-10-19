# ADR 3: Adopting PostgreSQL as the Database System

## Executive Summary

This ADR details our thought process regarding our database system's choice and highlights the factors influencing this choice. We considered MySQL, Microsoft SQL Server, and PostgreSQL, ultimately opting for PostgreSQL because of its robust features, scalability, and suitability for our specific needs thanks to its pgvector extension.

## Context
Today, effective data management is crucial to CFIA's AI Lab as we manage enormous amounts of information, requiring a database management system (DBMS). This choice is vital to ensure the security of sensitive data, offer high performance and scalability, support data analysis, facilitate collaboration between teams, and reduce operational costs.

## Decision
We decided to adopt PostgreSQL as our database management system (DBMS) due to its open-source nature and the presence of a large and active community. This guarantees regular updates, bug fixes, and a rich array of extensions and plugins such as pgvector and PostGIS, making it exceptionally well-suited for handling diverse data, including vector and geographic data. This attribute is particularly significant for AI applications which is what the AI Lab does. Furthermore, the availability of PostgreSQL as a Database-as-a-Service in Azure enhances flexibility and scalability, offering a substantial advantage for our applications.

While PostgreSQL has several advantages, it's important to consider the cons as well, especially the complexity of configuration and the steeper learning curve for beginners. However, these issues may be mitigated by experienced database administrators or the availability of managed PostgreSQL services that handle many administrative tasks.

## Alternatives Considered
### PostgreSQL
#### Pros
PostgreSQL stands out as a great DBMS solution that offers traditional database benefits with an emphasis on reliability and maturity. Notably, it's also available as a Database-as-a-Service in Azure. Here are some key advantages of PostgreSQL:

- **Open Source and Community Support:** Open-source nature and big community ensure regular updates, bug fixes, and a lot of extensions and plugins.
- **Security Features:** Role-based access control, SSL/TLS support, and data encryption.
- **Reliability:** Highly reliable and has a proven track record for handling mission-critical and high-traffic applications. It supports ACID (Atomicity, Consistency, Isolation, Durability) properties, ensuring data integrity.
- **Diverse Data Types and Extensions:** Supports a wide variety of data types and has powerful extensions such as pgvector which is crucial for handling vector data in our AI applications. Also provides robust support for spatial and geographic data through PostGIS.

#### Cons
- **Complex Configuration:** Complex to configure and optimize, especially for users with limited database administration experience.
- **Performance Tuning:** Default configuration might not be ideal for all use cases.
- **Learning Curve:** Steeper learning curve for beginners compared to some other database systems due to its feature-rich and extensible nature.

### Microsoft SQL Server
#### Pros
- **Integrated Environment:** Comprehensive tools and services for maintenance, business intelligence, and analytics.
- **Performance:** High performance and robustness for complex, large-scale applications.
Security Features: Advanced security features for data protection.
#### Cons
- **Cost:** High licensing costs.
- **Community Support:** Less community support compared to open-source options.

### MySQL
#### Pros
- **User-Friendly:** Easier to set up and manage, especially for users with basic database administration skills.
- **Performance:** High-performance with read-heavy workloads.
- **Community Support:** Active open-source community.
#### Cons
- **Scalability:** Limited scalability for handling complex queries and large datasets.
- **Data Integrity:** Less strict data integrity enforcement.
- **Customization:** Limited customization and extensibility.

## Consequences
The adoption of PostgreSQL will facilitate data integrity, elevate reliability, offer the flexibility to adapt to evolving needs, and accommodate future growth. It also grants us access to an active community. However, it will require some investment in training and infrastructure setup to maximize the benefits of PostgreSQL for our projects.

## References

- [Postgres pgvector Extension - Vector Database with PostgreSQL / Langchain Integration](https://youtu.be/FDBnyJu_Ndg?si=sBfBluS3G2TlW6RN) - BugBytes
- [PostgreSQL: The World's Most Advanced Open Source Relational Database](https://www.postgresql.org/) - postgresql.org
- [What is PostgreSQL and why do banking software developers love it?](https://ubuntu.com/blog/what-is-postgresql) - Kris Sharma
- [Why more and more enterprises are choosing PostgreSQL as their go-to database!](https://www.enterprisedb.com/postgres-tutorials/why-more-and-more-enterprises-are-choosing-postgresql-their-go-database#:~:text=take%20another%20look.-,PostgreSQL%20is%20reliable,the%20transaction%20is%20then%20committed.) - 
Thom Brown