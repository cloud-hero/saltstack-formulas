include:
  - roles.elk.elasticsearch.service

{% from "roles/elk/elasticsearch/settings.sls" import elasticsearch with context %}

{%- if elasticsearch.major_version == 5 %}
{%- set jvm_opts = salt['pillar.get']('elasticsearch:jvm_opts') %}
{%- if jvm_opts %}
/etc/elasticsearch/jvm.options:
  file.managed:
    - mode: 0770
    - owner: elasticsearch
    - group: elasticsearch
    - contents_pillar: elasticsearch:jvm_opts
    - watch_in:
      - service: elasticsearch
{% endif -%}
{% endif -%}