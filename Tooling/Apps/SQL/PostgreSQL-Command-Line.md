# PostgreSQL Commands

## Introduction

PostgreSQL, also known as Postgres, is a free and open-source relational
database management system emphasizing extensibility and SQL compliance. The
commands described below are used to connect to a database, set search paths,
and execute SQL files.

## Commands

### Connect to a database

```shell
psql -U username -d database_name
```

This command is used to connect to a specific PostgreSQL database. Replace
`username` with your user name and `database_name` with the name of the database
you want to connect to.

### Set search path and execute SQL file

```shell
PGOPTIONS=--search_path=schema_name psql -U username -d database_name -a -f 2023-11-28-create-histogram.sql
```

This command sets the search path to a specific schema and executes an SQL file.
Replace `schema_name` with the name of your schema, `username` with your
username, `database_name` with the name of your database, and replace
`2023-11-28-create-histogram.sql` with your SQL file name.

### Execute SQL file and output to CSV

```shell
psql -U username -d database_name \
     -a --csv \
     -f 2023-11-30-select-chunk-score.sql \
     -o result.html
```

This command executes an SQL file and outputs the result to a CSV file. Replace
`username` with your username, `database_name` with the name of your database,
`2023-11-30-select-chunk-score.sql` with your SQL file name, and `result.html`
with the name of the output file.

## Conclusion

These commands provide a way to interact with PostgreSQL databases, execute SQL
files and manage the output format of the results.
