include:
  - tools

consul-get:
  archive.extracted:
    - name: /usr/local/sbin
    - source: https://releases.hashicorp.com/consul/0.6.3/consul_0.6.3_linux_amd64.zip
    - source_hash: md5=a336895f0b2d9c4679524f0c9896e1ec
    - archive_format: zip
    - if_missing: /usr/local/sbin/consul
  file.managed:
    - name: /usr/local/sbin/consul
    - mode: 700
