# ADR on our choices of database structure

This ADR details our decisions regarding the database structure and highlights the factors influencing our choices.

![AiLab-db](./002-database-structure-diagram.png)

## Top-level
- **Title:** ADR on our choices of database structure
- **Status:** Proposed
- **Evaluation Criteria:** We want to figure out the best way to set up the database so that many products can work together smoothly. This will make things flexible, easy to take care of, and help different teams work together better.

**Candidates to Consider:**
1. **Separate Databases (Current Setup)**
Our current database structure maintains separate databases, like "louis-db" and "nachet-db." This can make the code easier to understand at first, but there are some difficulties. It can result in redundancy, reduced flexibility, collaboration challenges between teams, and potential data conflicts.
3. **Consolidated Database Approach**
The proposed idea is to use a single database for all our products.
This approach has benefits like easier teamwork, no repeated data, and more flexibility in managing different products.
However, there are a lot of files to change, and it can make the developing process harder.

## Research and Analysis of Each Candidate
During our research, we took a close look at how "louis-db" and "nachet-db" are set up right now and thought about changing things. We found that having separate databases created problems when it came to making changes and working together. Bringing these databases together into one place has a lot of benefits. It makes managing the database easier, lowers the chances of errors, and better supports the products we handle. Switching to a single, unified database structure is the best choice for our database.

- **Does/Doesn't Meet Criteria and Why:**
Our current separate databases aren't good because they lead to repeating information, lack flexibility, and make teamwork difficult. But the changes we want to make are better because they make things work together, are easier to handle, and improve the computer code.

## How Did You Evaluate the Candidates?
We evaluated the candidates based on the following criteria:
- Efficiency
- Flexibility
- Simplicity
- Maintainability
- Collaborative potential

## Why Did You Choose the Winner?
We chose the second option, a Consolidated Database Approach. It is more efficient, flexible, maintainable, and much easier to collaborate with other team members. The only aspect that's challenging to assess is simplicity. Renaming and moving folders for all related projects will require a significant amount of work, but it will certainly prove beneficial in the future.

## What Is Happening Since Then?
The proposed changes are under consideration for implementation, with a focus on developing the "ailab-db" as the core database and creating a modular product integration system.

## Knowing What You Know Now, What Would You Advise People to Do Differently?
We think it's a good idea for others to think about how changing their database now can help them in the future when they have more products and need to grow. Sometimes, making some changes and spending some money at the beginning can be really helpful later on.

- **Recommendation:**
We suggest making the changes we talked about, like calling "louis-db" by a new name, "ailab-db," and arranging things in a better way. These changes match our goal and are super important for handling lots of products, making things easier to use, taking care of the computer code, and helping teams work together better.
