deploy a test config file:
  file.managed:
    - name: /etc/http/test.conf
    - source: salt://conf/test.conf
    - makedirs: True
