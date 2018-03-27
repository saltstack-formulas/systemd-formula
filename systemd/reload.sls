reload_systemd_configuration:
  cmd.wait:
    - name: systemctl daemon-reload
    - runas: root
