include:
  - roles.elk.elasticsearch.repo

{% from "roles/elk/elasticsearch/map.jinja" import elasticsearch_map with context %}
{% from "roles/elk/elasticsearch/settings.sls" import elasticsearch with context %}

elasticsearch_pkg:
  pkg.installed:
    - name: {{ elasticsearch_map.pkg }}
    {% if elasticsearch.version %}
    - version: {{ elasticsearch.version }}
    {% endif %}
    - require:
      - sls: roles.elk.elasticsearch.repo
