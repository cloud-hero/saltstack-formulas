MySQL Formula
=============

This formula allows you to install and configure the MySQL server

Config example
--------------

```
mysql:
  server:
    root_password: 'CMX6cFRowAngry'
    mysqld:
      bind-address: 0.0.0.0
      long_query_time: '1'
      slow_query_log: '1'
      max_connections: '300'
      innodb_file_per_table: 'Yes'
```

Inspired mostly from [here](https://github.com/saltstack-formulas/mysql-formula).
