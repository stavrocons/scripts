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
