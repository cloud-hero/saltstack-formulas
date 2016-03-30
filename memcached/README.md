Memcached server
================

This formula installs and configured the memcached service.

Config example
--------------

```
memcached:
  verbose_level: 0
  memory_cap: 128
  port: 11211
  listen_address: '127.0.0.1'
  max_connections: 1024
```

Inspired mostly from [here](https://github.com/saltstack-formulas/memcached-formula)
