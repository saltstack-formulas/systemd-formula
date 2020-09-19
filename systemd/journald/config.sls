{%- from "systemd/map.jinja" import systemd with context %}
{%- from "systemd/libtofs.jinja" import files_switch with context -%}

{%- set journald = systemd.get('journald', {}) %}
{%- set config = journald.get('config', {}) %}

journald:
  {%- if journald.config_source == 'file' %}
  file.managed:
    - name: /etc/systemd/journald.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: {{ files_switch(['journald.conf'],
                              lookup='journald',
                              use_subpath=True
                              )
              }}
  {%- elif journald.config_source == 'pillar' %}
  ini.options_present:
    - name: /etc/systemd/journald.conf
    - separator: '='
    - strict: True
    - sections:
        Journal:
          {%- for k, v in config.items() %}
            {%- if k in [
              'Audit',
              'Compress',
              'ForwardToConsole',
              'ForwardToKMsg',
              'ForwardToSyslog',
              'ForwardToWall',
              'LineMax',
              'MaxFileSec',
              'MaxLevelConsole',
              'MaxLevelKMsg',
              'MaxLevelStore',
              'MaxLevelSyslog',
              'MaxLevelWall',
              'MaxRetentionSec',
              'RateLimitBurst',
              'RateLimitIntervalSec',
              'ReadKMsg',
              'RuntimeKeepFree',
              'RuntimeMaxFileSize',
              'RuntimeMaxFiles',
              'RuntimeMaxUse',
              'Seal',
              'SplitMode',
              'Storage',
              'SyncIntervalSec',
              'SystemKeepFree',
              'SystemMaxFileSize',
              'SystemMaxFiles',
              'SystemMaxUse',
              'TTYPath',
              ]
            %}
          {{ k }}: {{ v | yaml }}
            {%- endif %}
          {%- endfor %}

    {%- endif %}
    - listen_in:
      - service: journald
  service.running:
    - name: systemd-journald
    - enable: True
