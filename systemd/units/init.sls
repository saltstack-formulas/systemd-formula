include:
  - systemd.reload

{% import_yaml 'systemd/units/unittypes.yaml' as unittypes %}

{% for unittype, units in pillar.get('systemd', {}).items()  %}
  {% if unittype in unittypes.get('Valid') %}
    {% for unit, unitconfig in units.items() %}
      {% set unit_status = 'disable' if unitconfig.enabled is defined and unitconfig.enabled == false else 'enable' %}

systemd_systemd_units_file_{{ unit }}_{{ unittype }}:
  file.managed:
    - name: /etc/systemd/system/{{ unit }}.{{ unittype }}
    - template: jinja
    - source: salt://systemd/units/unit.jinja
    - context:
        config: {{ unitconfig|json }}
    - watch_in:
      - cmd: reload_systemd_configuration

systemd_systemd_units_cmd_enable_or_disable_{{ unit }}_{{ unittype }}:
  cmd.wait:
    - name: systemctl {{ unit_status }} {{ unit }}.{{ unittype }}
    - watch:
      - cmd: reload_systemd_configuration

      {% if unittype == 'service' %}
        {% set activation_status = unitconfig.status if unitconfig.status is defined and unitconfig.status == 'start' else 'stop' %}
systemd_systemd_units_activate_or_deactivate_{{ unit }}_{{ unittype }}:
  cmd.wait:
    - name: systemctl {{ activation_status }} {{ unit }}.{{ unittype }}
    - require:
      - cmd: systemd_systemd_units_cmd_enable_or_disable_{{ unit }}_{{ unittype }}
      - cmd: reload_systemd_configuration
    - watch:
      - cmd: reload_systemd_configuration
      {% endif %}
    {% endfor %}
  {% endif %}
{% endfor %}

