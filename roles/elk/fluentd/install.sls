{% set host =  grains['host'] %}
{% if grains['docker'] is defined %}

include:
  - docker.install

fluentdpull:
  dockerng.image_present:
    - name: cloudhero/fluentd:collector-alpine-latest
    - force: True

fluentd-collector-{{ host }}:
  dockerng.running:
    - image: cloudhero/fluentd:collector-alpine-latest
    - restart_policy: always
    - network_mode: host
    - environment:
      - ELASTICSEARCH_IP: {{ salt['pillar.get']('fluentd:elasticsearch_ip', 'localhost') }}
      - FLUENTD_URL: {{ salt['pillar.get']('fluentd:fluentd_url', 'example.domain.io') }}
      - SHAREDKEY: {{ salt['pillar.get']('fluentd:sharedkey', 'ReplaceMe') }}
    - log_config:
       Type: json-file
       Config:
         max-file: '10'
    - volumes: /fluentd/log
    - require:
      - sls: docker.install
      - pkg: docker-engine
{% endif %}

