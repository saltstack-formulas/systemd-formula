
Changelog
=========

`0.13.0 <https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.3...v0.13.0>`_ (2019-08-17)
------------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **yamllint:** include for this repo and apply rules throughout (\ `acbfdb3 <https://github.com/saltstack-formulas/systemd-formula/commit/acbfdb3>`_\ )

`0.12.3 <https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.2...v0.12.3>`_ (2019-07-21)
------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **path:** specify unit type when enabling systemd unit (\ `7f5dd9b <https://github.com/saltstack-formulas/systemd-formula/commit/7f5dd9b>`_\ ), closes `#41 <https://github.com/saltstack-formulas/systemd-formula/issues/41>`_
* **tofs:** reinstate custom TOFS files in this formula (\ `1b9b2b6 <https://github.com/saltstack-formulas/systemd-formula/commit/1b9b2b6>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kitchen+travis:** modify matrix to include ``develop`` platform (\ `ac12027 <https://github.com/saltstack-formulas/systemd-formula/commit/ac12027>`_\ )

`0.12.2 <https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.1...v0.12.2>`_ (2019-05-27)
------------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **\ ``networkd``\ :** don't remove files when using profiles (\ `93c29e2 <https://github.com/saltstack-formulas/systemd-formula/commit/93c29e2>`_\ )

`0.12.1 <https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.0...v0.12.1>`_ (2019-05-27)
------------------------------------------------------------------------------------------------------------

Documentation
^^^^^^^^^^^^^


* **tofs:** apply remaining comments from PR `#37 <https://github.com/saltstack-formulas/systemd-formula/issues/37>`_ (\ `d665676 <https://github.com/saltstack-formulas/systemd-formula/commit/d665676>`_\ )

`0.12.0 <https://github.com/saltstack-formulas/systemd-formula/compare/v0.11.0...v0.12.0>`_ (2019-05-26)
------------------------------------------------------------------------------------------------------------

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **kichen+travis:** test with pre-salted Docker images (\ `0e5776c <https://github.com/saltstack-formulas/systemd-formula/commit/0e5776c>`_\ )

Features
^^^^^^^^


* **tofs:** lookup files directory in “tpldir” hierarchy (\ `8d5b5ea <https://github.com/saltstack-formulas/systemd-formula/commit/8d5b5ea>`_\ )

`0.11.0 <https://github.com/saltstack-formulas/systemd-formula/compare/v0.10.0...v0.11.0>`_ (2019-05-13)
------------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **semantic-release:** implement an automated changelog (\ `eed041d <https://github.com/saltstack-formulas/systemd-formula/commit/eed041d>`_\ )
