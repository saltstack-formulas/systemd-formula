{%- from "systemd/map.jinja" import systemd with context -%}
{%- from "systemd/libtofs.jinja" import files_switch with context -%}

{%- set networkd = systemd.get('networkd', {}) %}

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
                              lookup='networkd'
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
wait_online:
  service.running:
    - name: systemd-networkd-wait-online
    - enable: True
{%- endif %}
