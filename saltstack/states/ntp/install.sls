{% from "ntp/map.jinja" import ntp with context %}

ntp-package:
  pkg.installed:
    - name: ntp

ntpdate-package:
  pkg.installed:
    - name: ntpdate

