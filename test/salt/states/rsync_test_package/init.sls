rsync_test_package:
  pkg.installed:
    - name: {{ 'net-misc/rsync' if grains.os_family == 'Gentoo' else 'rsync' }}

rsync_test_file:
  file.managed:
    - name: /etc/rsyncd.conf
    - content: Managed by salt
