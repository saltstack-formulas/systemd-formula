=======
systemd
=======

Formula to set up and configure systemd including
  * units
  * networkd
  * timesyncd
  * resolved

General customization strategies
================================

Because systemd config files aren't easy to recreate in jinja based on multiple
keys and different needs, I'm using TOFS.

_Template Override and Files Switch_ (TOFS) pattern as described in the
documentation file `TOFS_pattern.md`.

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
This state installs systemd-timesyncd 

``systemd.networkd``
--------------------
This state installs systemd-networkd and recursive add files per os_family/minion_id

``systemd.networkd.profiles``
--------------------
This state installs systemd-networkd profile files from pillar see pillar.example

``systemd.resolved``
--------------------
This state installs systemd-resolved and add the timesyncd.conf file per os_family/minion_id

``systemd.units``
-----------------
This formula provides a state to configure systemd units

