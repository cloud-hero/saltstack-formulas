{% from "vsftpd/map.jinja" import vsftpd with context %}

vsftpd:
  {% if vsftpd.server is defined %}
  pkg.installed:
    - name: {{ vsftpd.server }}
  {% endif %}
  service.running:
    - enable: True
    - name: {{ vsftpd.service }}
  {% if vsftpd.server is defined %}
    - require:
      - pkg: {{ vsftpd.server }}
  {% endif %}
