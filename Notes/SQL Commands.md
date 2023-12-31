# SQL COMMANDS

## DDL - DATA DEFINITION LANGUAGE
- CREATE
- DROP
- ALTER
- TRUNCATE

## DML - DATA MANIPULATION LANGUAGE
- INSERT
- UPDATE
- DELETE
- MERGE

## DCL - DATA CONTROL LANGUAGE
- GRANT
- REVOKE

## TCL - TRANSACTION CONTROL LANGUAGE
- COMMIT
- ROLLBACK
- SAVEPOINT

## DQL - DATA QUERY LANGUAGE
- SELECT

```mermaid
graph LR
  A[DDL] -->|CREATE| B((CREATE))
  A -->|DROP| C((DROP))
  A -->|ALTER| D((ALTER))
  A -->|TRUNCATE| E((TRUNCATE))
  F[DML] -->|INSERT| G((INSERT))
  F -->|UPDATE| H((UPDATE))
  F -->|DELETE| I((DELETE))
  F -->|MERGE| J((MERGE))
  K[DCL] -->|GRANT| L((GRANT))
  K -->|REVOKE| M((REVOKE))
  N[TCL] -->|COMMIT| O((COMMIT))
  N -->|ROLLBACK| P((ROLLBACK))
  N -->|SAVEPOINT| Q((SAVEPOINT))
  R[DQL] -->|SELECT| S((SELECT))
