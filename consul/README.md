# Consul cluster

This formula will setup a cluster for consul by using information retrieved from pillar.
For a 3 node cluster the pillar looks something like this:


Node1:
```
consul:
  encrypt: iVjvf3rnVS4zDM35Pyy/3g==
  advertise: 172.31.56.137
```

Node2:
```
consul:
  encrypt: iVjvf3rnVS4zDM35Pyy/3g==
  advertise: 172.31.54.154
  bootstrap: 'false'
  join:
    - 172.31.56.137
    - 172.31.57.252
```

Node3:
```
consul:
  encrypt: iVjvf3rnVS4zDM35Pyy/3g==
  advertise: 172.31.8.134
  bootstrap: 'false'
  join:
    - "172.31.56.137"
    - "172.31.54.154"
```
