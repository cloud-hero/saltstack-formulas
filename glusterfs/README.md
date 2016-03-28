GlusterFS
=========

This formula automatically configures GlusterFS on multiple nodes.

For this one the pillar is automatically generated so no user configuration is required in CloudHero.
In the future the user should be able to configure the `path` and the `user:group`.

GlusterFS pillar
----------------

```
glusterfs:
  server:
    peers:
    - b-demo3-do-dev-web1
    - b-demo3-do-dev-web2
    volumes:
       chgluster:
         storage: /srv/glusterfs
         replica: 2
         bricks:
         - b-demo3-do-dev-web1:/srv/glusterfs
         - b-demo3-do-dev-web2:/srv/glusterfs
    enabled: true
  client:
    volumes:
      chgluster:
        path: /var/www
        server: b-demo3-do-dev-web1
        user: www-data
        group: www-data
    enabled: true
```

Inspired mostly from (here)[https://github.com/tcpcloud/salt-formula-glusterfs].
