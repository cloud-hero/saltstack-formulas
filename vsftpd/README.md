vsftpd formula
==============

This one installs an FTP server.

If it's desired to have more usable out of the box defaults, just select `vsftpd.config`.

The following default values will be used, of you could change them as you please:

Config example
--------------

```
vsftpd_config:
  listen: 'YES'
  anonymous_enable: 'NO'
  local_enable: 'YES'
  dirmessage_enable: 'YES'
  use_localtime: 'YES'
  xferlog_enable: 'YES'
  connect_from_port_20: 'YES'
```
