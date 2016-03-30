Redis Server
============

This formula installs and starts the Redis server.

Config example
--------------

```
redis:
  port: 6379
  bind: 127.0.0.1
  maxmemory: 256mb
  maxmemory-policy: allkeys-lru

```

Inspired mostly from [here](https://github.com/saltstack-formulas/redis-formula).
