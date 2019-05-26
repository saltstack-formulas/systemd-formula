include:
  - systemd.reload

{%- from "systemd/map.jinja" import systemd with context %}
{%- from "systemd/libtofs.jinja" import files_switch with context %}

{%- set timesyncd = systemd.get('timesyncd', {}) %}
{%- set timezone = timesyncd.get('timezone', 'UTC') %}
{%- set config = timesyncd.get('config', {}) %}

{%- set virtual = salt['grains.get']('virtual') | default('physical', True) %}
{%- set virtual_subtype = salt['grains.get']('virtual_subtype') | default('', True) %}

timesyncd:
  {%- if timesyncd.pkg %}
  pkg.installed:
    - name: {{ timesyncd.pkg }}
  {%- endif %}
  {%- if timesyncd.config_source == 'file' %}
  file.managed:
    - name: /etc/systemd/timesyncd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: {{ files_switch(['timesyncd.conf'],
                              lookup='timesyncd'
                              )
              }}
  {%- elif timesyncd.config_source == 'pillar' %}
  ini.options_present:
    - name: /etc/systemd/timesyncd.conf
    - separator: '='
    - strict: True
    - sections:
        Time:
          NTP: {{ config.NTP | yaml }}
          FallbackNTP: {{ config.FallbackNTP | yaml }}
          RootDistanceMaxSec: {{ config.RootDistanceMaxSec | yaml }}
          PollIntervalMinSec: {{ config.PollIntervalMinSec | yaml }}
          PollIntervalMaxSec: {{ config.PollIntervalMaxSec | yaml }}
    {%- endif %}
    - listen_in:
      - service: timesyncd
    - watch_in:
      - cmd: timesyncd
  cmd.wait:
    - name: timedatectl set-ntp true
    - runas: root
  service.running:
    - name: systemd-timesyncd
    - enable: True
    - require:
      - cmd: reload_systemd_configuration
  timezone.system:
    - name: {{ timezone }}

# This is necessary in order to allow timesyncd to run on virtual machines.
timesyncd-allowvirtual:
{%- if virtual != "physical" or virtual_subtype == "Docker" %}
  file.managed:
    - name: /etc/systemd/system/systemd-timesyncd.service.d/allowvirtual.conf
    - contents: "[Unit]\nConditionVirtualization="
    - makedirs: True
{%- else %}
  file.absent:
    - name: /etc/systemd/system/systemd-timesyncd.service.d/allowvirtual.conf
{%- endif %}
    - watch_in:
      - cmd: reload_systemd_configuration
