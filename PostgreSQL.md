# Database dump / import
#### Create User  
```postgresql
CREATE ROLE user WITH LOGIN PASSWORD 'password'
```

#### Dublicate  
```postgresql
CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER dbuser;
```

#### Dump
```postgresql
pg_dump db > db.sql -h localhost -U dbuser
```
#### Dump data only
```postgresql
pg_dump db > db.sql --data-only -h localhost -U dbuser
```
#### Dump without owner and access control list
```postgresql
pg_dump --no-owner --no-acl db > db.sql -h localhost -U dbuser
```

#### Import
```postgresql
\i path/to/dump.sql
```

# Duplicate database
```postgresql
create database newdb with template originaldb owner dbuser;
```

# List all tables
```postgresql
select * from pg_catalog.pg_tables;
```

# List table columns
```postgresql
select * from information_schema.columns where table_name = <table_name>;
```

# Enable extension 
```postgresql
cretae extension <extension_name>;
```

# Terminate sessions 
```postgresql
select pg_terminate_backend(pid) 
from pg_stat_activity 
where 
-- don't kill my own connection!
pid <> pg_backend_pid()
-- don't kill the connections to other databases
and datname = 'database_name';
```
# Generate Sequence Update Statements  
```postgresql
select 'select setval(' ||
       quote_literal(quote_ident(pgt.schemaname) || '.' || quote_ident(s.relname)) ||
       ', coalesce(max(' ||quote_ident(c.attname)|| '), 1) ) from ' ||
       quote_ident(pgt.schemaname)|| '.'||quote_ident(t.relname)|| ';'
from pg_class as s,
     pg_depend as d,
     pg_class as t,
     pg_attribute as c,
     pg_tables as pgt
where s.relkind = 'S'
    and s.oid = d.objid
    and d.refobjid = t.oid
    and d.refobjid = c.attrelid
    and d.refobjsubid = c.attnum
    and t.relname = pgt.tablename
order by s.relname;
```
