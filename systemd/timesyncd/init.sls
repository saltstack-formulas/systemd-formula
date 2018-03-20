{% from "systemd/macros.jinja" import files_switch with context -%}

timesyncd:
  file.managed:
    - name: /etc/systemd/timesyncd.conf
    - source: {{ files_switch('systemd/timesyncd', ['/timesyncd.conf']) }}
  cmd.wait:
    - name: timedatectl set-ntp true
    - runas: root
    - watch:
      - file: timesyncd
  service.running:
    - name: systemd-timesyncd
    - enable: True

# This is necessary in order to allow timesyncd to run on virtual machines.
daemon-reload:
  cmd.wait:
    - name: systemctl daemon-reload
    - runas: root

{%- if grains['virtual'] != "physical" %}
timesyncd-allowvirtual:
  file.managed:
    - name: /etc/systemd/system/systemd-timesyncd.service.d/allowvirtual.conf
    - contents: "[Unit]\nConditionVirtualization="
    - makedirs: True
    - watch_in:
      - cmd: daemon-reload
{% else %}
timesyncd-allowvirtual:
  file.absent:
    - name: /etc/systemd/system/systemd-timesyncd.service.d/allowvirtual.conf
    - watch_in:
      - cmd: daemon-reload
{% endif %}
