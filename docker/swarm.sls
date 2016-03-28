swarmpull:
  dockerng.image_present:
    - name: swarm

swarm-manage:
  dockerng.running:
    - image: swarm
    - restart_policy: always
    - port_bindings: 4000:2375
    - cmd: "manage -H :2375 --replication --advertise={{ salt.pillar.get('consul:advertise') }}:4000 consul://{{ salt.pillar.get('consul:advertise') }}:8500"

swarm-join:
  dockerng.running:
    - image: swarm
    - restart_policy: always
    - cmd: "join --advertise={{ salt.pillar.get('consul:advertise') }}:2375 consul://{{ salt.pillar.get('consul:advertise') }}:8500"
