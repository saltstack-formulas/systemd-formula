include:
  - systemd.reload

{% import_yaml 'systemd/units/unittypes.yaml' as unittypes %}

{% for unittype, units in pillar.get('systemd', {}).items()  %}
  {% if unittype in unittypes.get('Valid') %}
    {% for unit, unitconfig in units.items() %}

/etc/systemd/system/{{ unit }}.{{ unittype }}:
  file.managed:
    - template: jinja
    - source: salt://systemd/units/unit.jinja
    - context:
        config: {{ unitconfig }}
    - watch_in:
      - cmd: reload_systemd_configuration

enable_{{ unit }}_{{ unittype }}:
  cmd.wait:
    - name: systemctl enable {{ unit }}
    - watch:
      - cmd: reload_systemd_configuration

    {% endfor %}
  {% endif %}
{% endfor %}

