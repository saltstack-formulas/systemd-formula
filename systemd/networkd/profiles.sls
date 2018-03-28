include:
  - systemd.reload

{% for networkdprofile, profiles in salt['pillar.get']('systemd:networkd:profiles').items()  %}
  {% for profile, profileconfig in profiles.items() %}

/etc/systemd/network/{{ profile }}.{{ networkdprofile }}:
  file.managed:
    - template: jinja
    - source: salt://systemd/networkd/templates/profile.jinja
    - context:
        config: {{ profileconfig }}
    - watch_in:
      - cmd: reload_systemd_configuration
  {% endfor %}
{% endfor %}

