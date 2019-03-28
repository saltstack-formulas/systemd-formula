include:
  - systemd.reload

{% from "systemd/map.jinja" import systemd with context -%}
{% from "systemd/libtofs.jinja" import files_switch with context -%}

{%- set timesyncd = systemd.get('timesyncd', {}) %}
{%- set timezone = timesyncd.get('timezone', 'UTC') %}
{%- set config = timesyncd.get('config', {}) %}

{%- set virtual = salt['grains.get']('virtual') | default('physical', True) -%}
{%- set virtual_subtype = salt['grains.get']('virtual_subtype') | default('', True) -%}

timesyncd:
  {% if timesyncd.pkg %}
  pkg.installed:
    - name: {{ timesyncd.pkg }}
  {% endif %}
  ini.options_present:
  file.managed:
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
  cmd.wait:
    - name: timedatectl set-ntp true
    - runas: root
    - watch:
      - file: timesyncd
  service.running:
    - name: systemd-timesyncd
    - enable: True
    - require:
      - cmd: reload_systemd_configuration
  timezone.system:
    - name: {{ timezone }}

# This is necessary in order to allow timesyncd to run on virtual machines.
{%- if virtual != "physical" or virtual_subtype == "Docker" %}
timesyncd-allowvirtual:
  file.managed:
    - name: /etc/systemd/system/systemd-timesyncd.service.d/allowvirtual.conf
    - contents: "[Unit]\nConditionVirtualization="
    - makedirs: True
    - watch_in:
      - cmd: reload_systemd_configuration
{% else %}
timesyncd-allowvirtual:
  file.absent:
    - name: /etc/systemd/system/systemd-timesyncd.service.d/allowvirtual.conf
    - watch_in:
      - cmd: reload_systemd_configuration
{% endif %}
