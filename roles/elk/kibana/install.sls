{% set ip =  grains['ip_interfaces']['eth0'][0] %}
{% set host =  grains['host'] %}
{% from "roles/elk/elasticsearch/settings.sls" import elasticsearch with context %}
{% if grains['docker'] is defined %}

include:
  - docker.install

kibanapull:
  dockerng.image_present:
    - name: kibana:{{ elasticsearch.version }}
    - force: True 

kibana-{{ host }}:
  dockerng.running:
    - image: kibana:{{ elasticsearch.version }}
    - restart_policy: always
    - port_bindings: 5601:5601
    - environment:
      - ELASTICSEARCH_URL: http://{{ ip }}:9200
    - log_config:
       Type: json-file
       Config:
         max-file: '10'
    - require:
      - sls: docker.install
      - pkg: docker-engine
{% endif %}

