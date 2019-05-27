# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "systemd/map.jinja" import systemd with context %}
{%- set networkd = systemd.get('networkd', {}) %}
{%- set profiles = networkd.get('profiles', {}) %}

include:
  - systemd.reload

{% if profiles is mapping %}
{% for networkdprofile, types in profiles.items()  %}
  {% for profile, profileconfig in types.items() %}

/etc/systemd/network/{{ profile }}.{{ networkdprofile }}:
  file.managed:
    - template: jinja
    - source: salt://systemd/networkd/templates/profile.jinja
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: true
    - dir_mode: 755
    - context:
        config: {{ profileconfig|json }}
    - watch_in:
      - cmd: reload_systemd_configuration
  {% endfor %}
{% endfor %}
{% endif %}
