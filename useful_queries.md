Get all tablespaces size

```sql
SELECT *, pg_size_pretty(pg_tablespace_size(spcname)) FROM pg_tablespace;
```

Get tables size power bi DAX Studio

```sql
SELECT dimension_name AS tablename,
attribute_name AS columnname,
datatype,((dictionary_size/1024)/1000) AS size_mb
FROM $system.discover_storage_table_columns
WHERE dictionary_size > 0
```

Search in Postgres procedures text
```sql

select * from pg_proc where prosrc ilike '%text%';
```
Check tables size by tablespace
```sql
select schemaname, tablename
     , pg_relation_size(schemaname || '.' || tablename) as size_bytes
  from pg_tables
  where tablespace = 'data02_tbs'
  order by 3 desc
```
