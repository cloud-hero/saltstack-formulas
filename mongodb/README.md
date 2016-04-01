MongoDB
=======

This formula installs and configures MongoDB

By default it will install the stable MongoDB version from the [official](http://repo.mongodb.org) mongo repo.

Config example
--------------

```
mongodb:
  version: 3.3
  log_path: /var/log/mongodb/mongod.log
  db_path: /var/lib/mongodb
  bind_ip: 0.0.0.0
  port: 27017
  
```

