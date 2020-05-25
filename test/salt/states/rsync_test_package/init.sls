rsync_test_package:
  pkg.installed:
    - name: rsync

rsync_test_file:
  file.managed:
    - name: /etc/rsyncd.conf
    - content: Managed by salt
