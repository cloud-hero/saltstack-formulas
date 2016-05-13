include:
  - tools

consul-get:
  archive.extracted:
    - name: /usr/local/sbin
    - source: https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip
    - source_hash: md5=242bc78a4dc41b0e7039948af45449ba
    - archive_format: zip
    - if_missing: /usr/local/sbin/consul
  file.managed:
    - name: /usr/local/sbin/consul
    - mode: 700
