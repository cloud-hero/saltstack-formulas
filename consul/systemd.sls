consul.service:
  file.managed:
    - name: /etc/systemd/system/consul.service
    - contents:
      - "[Unit]"
      - Description=consul agent
      - Requires=network-online.target
      - After=network-online.target
      - ""
      - "[Service]"
      - EnvironmentFile=-/etc/sysconfig/consul
      - Environment=GOMAXPROCS=2
      - Restart=on-failure
      - ExecStart=/usr/local/sbin/consul agent $OPTIONS -config-dir=/etc/consul.d
      - ExecReload=/bin/kill -HUP $MAINPID
      - KillSignal=SIGINT
      - ""
      - "[Install]"
      - WantedBy=multi-user.target
  module.wait:
    - name: service.systemctl_reload
    - watch:
      - file: /etc/systemd/system/consul.service
  service.running:
    - enable: True
