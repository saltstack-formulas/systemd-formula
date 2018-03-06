{% for unittype, units in pillar['systemd'].iteritems()  %}
{% for unit, unitconfig in units.iteritems() %}

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
{% endfor %}

reload_systemd_configuration:
  cmd.wait:
    - name: systemctl daemon-reload

