{%- from "systemd/networkd/map.jinja" import networkd with context -%}
{% from "systemd/macros.jinja" import files_switch with context -%}

networkd:
  file.recurse:
    - name: {{ networkd.path }}
    - user: root
    - group: root
    - template: jinja
    - source: {{ files_switch('systemd:networkd', ['/network']) }}
    - clean: True
    - dir_mode: 755
    - file_mode: 644
    - include_empty: True
    - listen_in:
      - service: networkd
  service.running:
    - name: {{ networkd.service }} 
    - enable: True

{%- if networkd.wait_online %}
wait_online:
  service.running:
    - name: systemd-networkd-wait-online
    - enable: True
{%- endif %}
