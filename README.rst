=======
systemd
=======

Formula to set up and configure systemd including
  * units
  * networkd
  * timesyncd
  * resolved

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

``systemd.resolved``
--------------------
This state installs systemd-resolved and add the timesyncd.conf file per os_family/minion_id

``systemd.units``
-----------------
This formula provides a state to configure systemd units

