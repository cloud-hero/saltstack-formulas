collectd
========

This formula installs and configures collectd.

By default it will install the stable collectd version from the linux distro repo.

Config example
--------------

Configuring it is done mainly from pillar. The prefered way is to have a base pillar file and then separate pillars for the master, database, web and other type of node roles.

init.sls pillar:

```
collectd:
  FQDNLookup: true
  plugins:
    default: [cpu, load, memory]
    df:
      FSTypes:
        - 'ext4'
  
```

master.sls pillar:
```
include:
  - collectd

collectd:
  plugins:
    network:
      type: 'Listen'
      host: '10.240.0.2'
      port: 25826
```

db.sls pillar:
```
include:
  - collectd

collectd:
  plugins:
    network:
      host: '10.240.0.2'
      port: 25826
    mysql:
      databases:
        - host: 'localhost'
          name: 'mysql'
          socket: '/var/run/mysqld/mysqld.sock'
          masterstats: true
          user: 'root'
          pass: 'somepassword'
```

Inspired mostly from [here](https://github.com/saltstack-formulas/collectd-formula).
