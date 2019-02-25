{%- from "systemd/map.jinja" import systemd with context -%}
{%- from "systemd/macros.jinja" import files_switch with context -%}

{%- set resolved = systemd.get('resolved', {}) %}

resolved:
  {% if resolved.pkg %}
  pkg.installed:
    - name: {{ resolved.pkg }}
  {% endif %}
  file.managed:
    - name: /etc/systemd/resolved.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: {{ files_switch(
                    salt['config.get'](
                        tpldir ~ ':tofs:files:resolved',
                        ['resolved.conf']
                    )
              ) }}
    - listen_in:
      - service: resolved
  service.running:
    - name: systemd-resolved
    - enable: True

resolv.conf:
  file.symlink:
    - name: {{ resolved.resolv_file }}
    - target: {{ resolved.resolv_target }}
    - force: True
    - backupname: /etc/resolv.conf.bak
    - listen_in:
      - service: resolved
