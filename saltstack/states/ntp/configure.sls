{% from "ntp/map.jinja" import ntp with context %}

/etc/ntp.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - contents_pillar: ntp:config:contents
    - watch_in:
      - service: ntp-service

