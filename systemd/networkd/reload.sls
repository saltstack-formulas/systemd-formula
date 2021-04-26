include:
  - systemd.networkd

systemd-networkd-reload-cmd-wait:
  cmd.wait:
    - name: networkctl reload
    - runas: root
    - require:
      - service: networkd
