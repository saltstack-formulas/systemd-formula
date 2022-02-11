include:
  - systemd.networkd

systemd-networkd-reload-cmd-wait:
  cmd.wait:  # noqa: 213
    - name: networkctl reload
    - runas: root
    - require:
      - service: networkd
