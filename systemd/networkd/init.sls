{% from "systemd/networkd/macros.jinja" import files_switch with context -%}

networkd:
  file.recurse:
    - name: /etc/systemd/network
    - user: root
    - group: root
    - template: jinja
    - source: {{ files_switch('systemd/networkd', ['/network']) }}
    - clean: True
    - dir_mode: 755
    - file_mode: 644
    - include_empty: True
    - listen_in:
      - service: networkd
  service.running:
    - name: systemd-networkd
    - enable: True
