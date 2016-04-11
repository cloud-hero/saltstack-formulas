uwsgi formula
=============

This formula allows you to install and configure uwsgi for using it with Python or PHP

Conf example
------------

```
uwsgi:
  lookup:
    plugins: ['uwsgi-plugin-python','python-flask']

  applications:
    managed:
      cloudhero-api.ini:
        enabled: True
        config:
          - master: True
            uid: 'www-data'
            gid: 'www-data'
            socket: '/run/uwsgi/flask_api.socket'
            chmod-socket: 664
            plugins: 'logfile,python'
            module: 'flask_runserver'
            callable: 'app'
            chdir: '/var/www/api'
            log-master: True
            log-reopen: True
            processes: 4
            threads: 4
```
Inspired mostly from [here](https://github.com/saltstack-formulas/uwsgi-formula/).
