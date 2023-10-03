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

Get partitions ddl
```
with recursive inh as (
   select i.inhrelid, null::text as parent
   from pg_catalog.pg_inherits i
     join pg_catalog.pg_class cl on i.inhparent = cl.oid
     join pg_catalog.pg_namespace nsp on cl.relnamespace = nsp.oid
   where nsp.nspname = 'public'         
     and cl.relname = 'table_name'   
   union all
   select i.inhrelid, (i.inhparent::regclass)::text
   from inh
   join pg_catalog.pg_inherits i on (inh.inhrelid = i.inhparent)
)
select 'alter table table_name detach partition '  || c.relname ||  ';' as "1) detach_partition",
           'alter table ' || c.relname || ' alter column created_at type timestamptz;' as "2) chane_type",
           'alter table table_name attach partition ' || c.relname || ' ' || pg_get_expr(c.relpartbound, c.oid, true) || ';' as "3) attach_parittion"
from inh
   join pg_catalog.pg_class c on inh.inhrelid = c.oid
   join pg_catalog.pg_namespace n on c.relnamespace = n.oid
   left join pg_partitioned_table p on p.partrelid = c.oid
order by n.nspname, c.relname;
```
