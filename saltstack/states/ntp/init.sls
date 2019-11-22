{% from "ntp/map.jinja" import ntp with context %}

include:
  - .install
  - .configure
  - .service

