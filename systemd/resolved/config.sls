{%- from "systemd/map.jinja" import systemd with context -%}
{%- set resolved = systemd.get('resolved', {}) %}
{%- set config = resolved.get('config', {}) %}

resolved:
  {% if resolved.pkg %}
  pkg.installed:
    - name: {{ resolved.pkg }}
  {% endif %}
  ini.options_present:
    - name: /etc/systemd/resolved.conf
    - separator: '='
    - strict: True
    - sections:
        Resolve:
          DNS: {{ config.DNS }}
          FallbackDNS: {{ config.FallbackDNS }}
          Domains: {{ config.Domains }}
          LLMNR: {{ config.LLMNR }}
          MulticastDNS: {{ config.MulticastDNS }}
          DNSSEC: {{ config.DNSSEC }}
          DNSOverTLS: {{ config.DNSOverTLS }}
          Cache: {{ config.Cache }}
          DNSStubListener: {{ config.DNSStubListener }}
          ReadEtcHosts: {{ config.ReadEtcHosts }}
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
