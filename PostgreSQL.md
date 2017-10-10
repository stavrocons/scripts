# Database dump / import

#### Dublicate  
```postgresql
CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER dbuser;
```

#### Dump
```postgresql
pg_dump db > db.sql -h localhost -U dbuser
```

#### Dump without owner and access control list
```postgresql
pg_dump --no-owner --no-acl db > db.sql -h localhost -U dbuser
```

#### Import
```postgresql
\i path/to/dump.sql
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

