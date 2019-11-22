{% set docker_group_members = salt['pillar.get']('docker:group_members') %}

{% if docker_group_members %}
docker_group:
  group.present:
    - name: docker
    - system: True
    - members: {{ docker_group_members }}
{% else %}
  {{ salt.test.exception("user group docker error dinges") }}
{% endif %}

