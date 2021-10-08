{%- from "systemd/map.jinja" import systemd with context -%}
{%- from "systemd/libtofs.jinja" import files_switch with context -%}

{%- set networkd = systemd.get('networkd', {}) %}
{%- set service_wait_online = 'systemd-networkd-wait-online' %}

networkd:
  {%- if networkd.pkg %}
  pkg.installed:
    - name: {{ networkd.pkg }}
  {%- endif %}
  {%- if networkd.profiles|length == 0 %}
  file.recurse:
    - name: {{ networkd.path }}
    - user: root
    - group: root
    - template: jinja
    - source: {{ files_switch(['network'],
                              lookup='networkd',
                              use_subpath=True
                 )
              }}
    - clean: True
    - dir_mode: 755
    - file_mode: 644
    - include_empty: True
    - listen_in:
      - service: networkd
  {%- endif %}
  service.running:
    - name: {{ networkd.service }}
    - enable: True

{%- if networkd.wait_online %}
wait_online-service-enabled:
  service.enabled:
    - name: {{ service_wait_online }}

wait_online:
  service.running:
    - name: {{ service_wait_online }}
{%- endif %}
