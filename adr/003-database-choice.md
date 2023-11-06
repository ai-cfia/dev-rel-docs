# ADR-003: Adopting PostgreSQL as the Database System

## Executive Summary

This Architecture Decision Record (ADR) details our thought process regarding
our database system's choice and highlights the factors influencing this choice.
We considered MySQL, Microsoft SQL Server, and PostgreSQL, ultimately opting for
PostgreSQL because of its robust features, scalability, and suitability for our
specific needs thanks to its pgvector extension.

## Context
Today, effective data management is crucial to Canadian Food Inspection Agency's
(CFIA) Artificial Intelligence Laboratory (AI Lab) as we manage enormous amounts
of information, requiring a database management system (DBMS). This choice is
vital to ensure the security of sensitive data, offer high performance and
scalability, support data analysis, facilitate collaboration between teams, and
reduce operational costs.

## Decision
The AI Lab decided to adopt PostgreSQL ([PostgreSQL Tutorial, n.d.](#ref-tutorial) and [P. G. D. Group, 2023](#ref-postgres)) as our DBMS due to its open source nature
and the presence of a large and active community. This guarantees regular
updates, bug fixes, and a rich array of extensions and plugins such as pgvector
and PostGIS, making it exceptionally well-suited for handling diverse data,
including vector and geographic data. This attribute is particularly significant
for AI applications which is what the AI Lab does. Furthermore, the availability
of PostgreSQL as a Database-as-a-Service in Azure enhances flexibility and
scalability, offering a substantial advantage for our applications.

Through other commercial versions such as [Citus](https://www.citusdata.com/)
(now owned by Microsoft) or [Timescale](https://www.timescale.com/), Postgresql
is the top database for big data ([Stack Overflow, n.d.](#ref-survey)). We use Azure Flexible Postgresql which comes
with better integration with Azure cloud.

While PostgreSQL has several advantages, it's important to consider the cons as
well, especially the complexity of configuration and the steeper learning curve
for beginners. However, these issues may be mitigated by experienced database
administrators or the availability of managed PostgreSQL services that handle
many administrative tasks.

## Alternatives Considered
### PostgreSQL 
#### Pros
PostgreSQL stands out as a great DBMS solution that offers traditional database
benefits with an emphasis on reliability and maturity ([T. Brown, 2023](#ref-database)). Notably, it's also
available as a Database-as-a-Service in Azure. Here are some key advantages of
PostgreSQL:

- Open Source and Community Support: Its open source nature and a community of
  thousands of people ensure regular updates, bug fixes, and a lot of extensions
  and plugins. There are more than a dozen mailing lists available as well as
  associated archives. For example, you can find monthly reviews of third party
  software's update. ([PostgreSQL announce, n.d.](#ref-announce), [PostgreSQL general, n.d.](#ref-general), and [PostgreSQL hackers, n.d.](#ref-hackers)) 
- Security Features: Role-based access control, SSL/TLS support, and data
  encryption.
- Reliability: Highly reliable and has a proven track record for handling
  mission-critical and high-traffic applications. It supports ACID (Atomicity,
  Consistency, Isolation, Durability) properties, ensuring data integrity. For
  example, Microsoft used an analytics dashboard, which tracks quality of
  Windows updates analyzing 20K types of metrics from over 1.2 billion Windows
  devices ([TECHCOMMUNITY.MICROSOFT.COM, 2023](#ref-architecture)).
- Diverse Data Types and Extensions: Supports a wide variety of data types (for
  example smallint, integer, decimal, numeric, real, serial...) and has powerful
  extensions such as pgvector ([B. Bytes, 2023](#ref-pgvector)) which is crucial for handling vector data in our
  AI applications. Also provides robust support for spatial and geographic data
  through PostGIS.

#### Cons
- Complex Configuration: Complex to configure and optimize, especially for users
  with limited database administration experience.
- Performance Tuning: Default configuration might not be ideal for all use
  cases.
- Learning Curve: Steeper learning curve for beginners compared to some other
  database systems due to its feature-rich and extensible nature.

### Microsoft SQL Server
#### Pros
- Integrated Environment: Comprehensive tools and services for maintenance,
  business intelligence, and analytics.
- Performance: High performance and robustness for complex, large-scale
applications. Security Features: Advanced security features for data protection.
#### Cons
- Cost: High licensing costs.
- Community Support: Less community support compared to open-source options.

### MySQL
#### Pros
- User-Friendly: Easier to set up and manage, especially for users with basic
  database administration skills.
- Performance: High-performance with read-heavy workloads.
- Community Support: Active open-source community.
#### Cons
- Scalability: Limited scalability for handling complex queries and large
  datasets.
- Data Integrity: Less strict data integrity enforcement.
- Customization: Limited customization and extensibility.

## Consequences
The adoption of PostgreSQL will facilitate data integrity, elevate reliability,
offer the flexibility to adapt to evolving needs, and accommodate future growth.
It also grants us access to an active community. However, it will require some
investment in training and infrastructure setup to maximize the benefits of
PostgreSQL for our projects.

## References

- <a id="ref-architecture"></a>Architecting petabyte-scale analytics by scaling out
  postgres on Azure with the CITUS extension. TECHCOMMUNITY.MICROSOFT.COM.
  (2023, January 31).
  https://techcommunity.microsoft.com/t5/azure-database-for-postgresql/architecting-petabyte-scale-analytics-by-scaling-out-postgres-on/ba-p/969685 
- <a id="ref-database"></a>Brown, T. (2023, January 19). Why more and more
  enterprises are choosing postgresql as their go-to database!. EDB.
  https://www.enterprisedb.com/postgres-tutorials/why-more-and-more-enterprises-are-choosing-postgresql-their-go-database 
- <a id="ref-pgvector"></a>Bytes, B. (2023, July 27). Postgres pgvector extension -
  vector database with PostgreSQL / Langchain Integration. YouTube.
  https://youtu.be/FDBnyJu_Ndg?si=sBfBluS3G2TlW6RN 
- <a id="ref-postgres"></a>Group, P. G. D. (2023, October 31). PostgreSQL.
  https://www.postgresql.org/ 
- <a id="ref-announce"></a>Pgsql-announce. PostgreSQL. (n.d.-a).
  https://www.postgresql.org/list/pgsql-announce/ 
- <a id="ref-general"></a>Pgsql-general. PostgreSQL. (n.d.-b).
  https://www.postgresql.org/list/pgsql-general 
- <a id="ref-hackers"></a>Pgsql-hackers. PostgreSQL. (n.d.-c).
  https://www.postgresql.org/list/pgsql-hackers/ 
- <a id="ref-survey"></a>Stack overflow developer survey 2023. Stack Overflow.
  (n.d.).
  https://survey.stackoverflow.co/2023/#most-popular-technologies-database 
- <a id="ref-tutorial"></a>What is postgresql?. PostgreSQL Tutorial. (n.d.).
  https://www.postgresqltutorial.com/postgresql-getting-started/what-is-postgresql/ 
