reload_systemd_configuration:
  cmd.wait:  # noqa: 213
    - name: systemctl daemon-reload
    - runas: root
