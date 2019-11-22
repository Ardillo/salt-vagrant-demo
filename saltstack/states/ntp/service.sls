{% from "ntp/map.jinja" import ntp with context %}

ntp-service:
  service.running:
    - name: ntp
    - enable: true
    - require:
      - pkg: ntp

