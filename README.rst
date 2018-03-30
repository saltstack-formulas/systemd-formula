=======
systemd
=======

Formula to set up and configure systemd including
  * units
  * networkd
  * timesyncd
  * resolved

.. image:: https://travis-ci.org/saltstack-formulas/systemd-formula.svg?branch=master

General customization strategies
================================

Because systemd config files aren't easy to recreate in jinja based on multiple
keys and different needs, I'm using TOFS.

_Template Override and Files Switch_ (TOFS) pattern as described in the
documentation file `TOFS_pattern.md`.

We provide a little change to the original TOFS pattern, the
`files_switch` macro consider the `prefix` as a pillar and not just
the directory path to the `files/` directory. It then replace any
colon `:` with slash `/` to form the directory prefix.

So, to configure the `files_switch` value of `systemd.networkd` you
must define the pillar `systemd:networkd:files_switch`. Another
example is provided in `pillar.example` for `systemd.timesyncd`.

.. note::
    See the full `Salt Formulas
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_ doc.

Available states
================

.. contents::
    :local:

``systemd``
----------

Installs the systemd packages and libraries.

``systemd.timesyncd``
---------------------
This state installs systemd-timesyncd and configures both NTP and timezone

``systemd.networkd``
--------------------
This state installs systemd-networkd and recursively adds files per os_family/minion_id

``systemd.networkd.profiles``
--------------------
This state installs systemd-networkd profile files from pillar see pillar.example

``systemd.resolved``
--------------------
This state installs systemd-resolved and adds the timesyncd.conf file per os_family/minion_id

``systemd.units``
-----------------
This formula provides a state to configure systemd units

