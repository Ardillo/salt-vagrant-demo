{% set version = salt['pillar.get']('docker:version') %}

docker.io:
  pkg.installed:
    - version: {{ version }}
  service.running:
    - name: docker

include:
  - docker.users
#  - docker.defaults

