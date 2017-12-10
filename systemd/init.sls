{% from "systemd/map.jinja" import systemd with context %}
  
systemd_main_pkg:
  pkg.installed:
    - name: {{ systemd.pkg }}

systemd_lib_pkgs:
  pkg.installed:
    - pkgs: {{ systemd.pkgs_libs|json }}


systemd_extra_pkgs:
  pkg.installed:
    - pkgs: {{ systemd.pkgs_extra|json }}

