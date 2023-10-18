# ADR 6: How we manage changes in databases

## Abstract

*This ADR details our thought process regarding our database managment system's and highlights the factors influencing this choice.*

## Context: 
CFIA projects Finesse and Louis Chat depend heavily on the PostgreSQL database. Changes to the database schema need to follow changes to the code as we introduce new features. 

When deploying, we need to be able to:

* Deploy known set of changes associated with the version of the backend we want to deploy.
* verify changes are correctly applied by running a test suite (probably backend test suite as it relates to the db).
* revert changes if necessary (or switch back to an older version of the database).


## Solutions considered:

## Decision:


## Consequences: 


## References:

- 