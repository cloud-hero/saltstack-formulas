{% from "vsftpd/map.jinja" import vsftpd with context %}

include:
  - vsftpd

vsftpd_config:
  file.managed:
    - name: {{ vsftpd.vsftpd_config }}
    - source: {{ vsftpd.vsftpd_config_src }}
    - template: jinja
    - user: root
    - mode: 644
    - watch_in:
      - service: {{ vsftpd.service }}

