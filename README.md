SaltStack Formulas
==================

Here you can see how things are going to be setup in your system.

We are happy to accept support for new software. In order to get started on how to extend this, have a look at the already provided formulas, such as the [memcached](https://github.com/cloud-hero/saltstack-formulas/tree/master/memcached) one.

**The purpose is to provide a stable repo which can be plugged in directly in SaltStack.**

All you have to do is create a new config file `/etc/salt/master.d/cloudhero.conf` with the following contents:

```
fileserver_backend:
  - git

gitfs_remotes:
  - https://github.com/cloud-hero/saltstack-formulas.git
```

After you restart the master the new files should be visible when you run `salt-run fileserver.file_list`. Depending on your Linux distro it might be required to [install GitPython](https://docs.saltstack.com/en/latest/topics/tutorials/gitfs.html#id3).

*Enjoy!*
