{%- from "systemd/map.jinja" import systemd with context %}
{%- from "systemd/libtofs.jinja" import files_switch with context -%}

{%- set resolved = systemd.get('resolved', {}) %}
{%- set config = resolved.get('config', {}) %}

resolved:
  {%- if resolved.pkg %}
  pkg.installed:
    - name: {{ resolved.pkg }}
  {%- endif %}
  {%- if resolved.config_source == 'file' %}
  file.managed:
    - name: /etc/systemd/resolved.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: {{ files_switch(['resolved.conf'],
                              lookup='resolved',
                              use_subpath=True
                              )
              }}
  {%- elif resolved.config_source == 'pillar' %}
  ini.options_present:
    - name: /etc/systemd/resolved.conf
    - separator: '='
    - strict: True
    - sections:
        Resolve:
          DNS: {{ config.DNS | yaml }}
          FallbackDNS: {{ config.FallbackDNS | yaml }}
          Domains: {{ config.Domains | yaml }}
          LLMNR: {{ config.LLMNR | yaml }}
          MulticastDNS: {{ config.MulticastDNS | yaml }}
          DNSSEC: {{ config.DNSSEC | yaml }}
          DNSOverTLS: {{ config.DNSOverTLS | yaml }}
          Cache: {{ config.Cache | yaml }}
          DNSStubListener: {{ config.DNSStubListener | yaml }}
          ReadEtcHosts: {{ config.ReadEtcHosts | yaml }}
    {%- endif %}
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
