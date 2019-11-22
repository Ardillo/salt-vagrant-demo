{% from "saltstack/map.jinja" import saltstack with context %}

salt-minion:
  pkg.installed:
    - version: {{ saltstack.version }}
  service.running:
    - name: salt-minion
    - enable: True
    - require:
      - pkg: salt-minion
    - watch:
      - file: /etc/salt/minion
      - file: /etc/salt/minion.d/*

/etc/salt/minion.d/highstate.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://saltstack/files/etc/salt/minion.d/highstate.conf
    - require:
      - pkg: salt-minion
    - watch_in:
      - service: salt-minion

/etc/salt/minion:
  file.serialize:
    - user: root
    - group: root
    - mode: 0644
    - dataset: {{ saltstack.minion.config }}
    - formatter: yaml
    - require:
      - pkg: salt-minion
    - watch_in:
      - service: salt-minion
