registratorpull:
  dockerng.image_present:
    - name: gliderlabs/registrator

registrator:
  dockerng.running:
    - image: gliderlabs/registrator
    - restart_policy: always
    - binds: /var/run/docker.sock:/tmp/docker.sock
    - cmd: "consul://{{ salt.pillar.get('consul:advertise') }}:8500"
