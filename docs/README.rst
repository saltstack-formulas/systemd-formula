.. _readme:

systemd-formula
===============

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/systemd-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/systemd-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Formula to set up and configure systemd including
  * units
  * networkd
  * timesyncd
  * resolved

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see :ref:`How to contribute <CONTRIBUTING>` for more details.

General customization strategies
--------------------------------

Because systemd config files aren't easy to recreate in jinja based on multiple
keys and different needs, I'm using TOFS.

`Template Override and Files Switch` (TOFS) pattern as described in the
documentation file `TOFS_pattern.md`.

.. note::
    See the full `Salt Formulas
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_ doc.

Available states
----------------

.. contents::
    :local:

``systemd``
^^^^^^^^^^^

Installs the systemd packages and libraries.

``systemd.timesyncd``
^^^^^^^^^^^^^^^^^^^^^
This state installs systemd-timesyncd and configures both NTP and timezone

``systemd.timesyncd.config``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This state installs systemd-timesyncd and adds the timesyncd.conf from pillar
(see pillar.example)

``systemd.networkd``
^^^^^^^^^^^^^^^^^^^^
This state installs systemd-networkd and recursively adds files per os_family/minion_id

``systemd.networkd.profiles``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This state installs systemd-networkd profile files from pillar (see pillar.example)

``systemd.resolved``
^^^^^^^^^^^^^^^^^^^^
This state installs systemd-resolved and recursively adds files per os_family/minion_id

``systemd.resolved.config``
^^^^^^^^^^^^^^^^^^^^^^^^^^^
This state installs systemd-resolved and adds the resolved.conf from pillar (see pillar.example)

``systemd.units``
^^^^^^^^^^^^^^^^^
This formula provides a state to configure systemd units

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``systemd`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.
