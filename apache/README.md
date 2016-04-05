Apache HTTPd formula
====================

This formula installs and configures the Apache HTTPd server.

Config example
--------------


```
apache:
  modules:
    enabled:
      - php5
      - rewrite
      - headers
    disabled:
      - proxy
```


