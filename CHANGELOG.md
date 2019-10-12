# Changelog

## [0.13.3](https://github.com/saltstack-formulas/systemd-formula/compare/v0.13.2...v0.13.3) (2019-10-12)


### Bug Fixes

* **rubocop:** add fixes using `rubocop --safe-auto-correct` ([](https://github.com/saltstack-formulas/systemd-formula/commit/a07960c))


### Continuous Integration

* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/systemd-formula/commit/01790ff))
* **travis:** merge `rubocop` linter into main `lint` job ([](https://github.com/saltstack-formulas/systemd-formula/commit/359e452))

## [0.13.2](https://github.com/saltstack-formulas/systemd-formula/compare/v0.13.1...v0.13.2) (2019-10-10)


### Bug Fixes

* **init.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/systemd-formula/commit/0af5472))
* **init.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/systemd-formula/commit/8d98cae))
* **map.jinja:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/systemd-formula/commit/68110aa))


### Continuous Integration

* **kitchen:** change `log_level` to `debug` instead of `info` ([](https://github.com/saltstack-formulas/systemd-formula/commit/7c870eb))
* **kitchen:** install required packages to bootstrapped `opensuse` [skip ci] ([](https://github.com/saltstack-formulas/systemd-formula/commit/f02b97e))
* **kitchen:** use bootstrapped `opensuse` images until `2019.2.2` [skip ci] ([](https://github.com/saltstack-formulas/systemd-formula/commit/e084acd))
* **kitchen+travis:** replace EOL pre-salted images ([](https://github.com/saltstack-formulas/systemd-formula/commit/d95f553))
* **platform:** add `arch-base-latest` ([](https://github.com/saltstack-formulas/systemd-formula/commit/021c7d0))
* **yamllint:** add rule `empty-values` & use new `yaml-files` setting ([](https://github.com/saltstack-formulas/systemd-formula/commit/f2582c6))
* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/systemd-formula/commit/a9f9889))
* use `dist: bionic` & apply `opensuse-leap-15` SCP error workaround ([](https://github.com/saltstack-formulas/systemd-formula/commit/3ca9b60))

## [0.13.1](https://github.com/saltstack-formulas/systemd-formula/compare/v0.13.0...v0.13.1) (2019-08-25)


### Documentation

* **readme:** update testing section ([9d4bd7e](https://github.com/saltstack-formulas/systemd-formula/commit/9d4bd7e))

# [0.13.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.3...v0.13.0) (2019-08-17)


### Features

* **yamllint:** include for this repo and apply rules throughout ([acbfdb3](https://github.com/saltstack-formulas/systemd-formula/commit/acbfdb3))

## [0.12.3](https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.2...v0.12.3) (2019-07-21)


### Bug Fixes

* **path:** specify unit type when enabling systemd unit ([7f5dd9b](https://github.com/saltstack-formulas/systemd-formula/commit/7f5dd9b)), closes [#41](https://github.com/saltstack-formulas/systemd-formula/issues/41)
* **tofs:** reinstate custom TOFS files in this formula ([1b9b2b6](https://github.com/saltstack-formulas/systemd-formula/commit/1b9b2b6))


### Continuous Integration

* **kitchen+travis:** modify matrix to include `develop` platform ([ac12027](https://github.com/saltstack-formulas/systemd-formula/commit/ac12027))

## [0.12.2](https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.1...v0.12.2) (2019-05-27)


### Bug Fixes

* **`networkd`:** don't remove files when using profiles ([93c29e2](https://github.com/saltstack-formulas/systemd-formula/commit/93c29e2))

## [0.12.1](https://github.com/saltstack-formulas/systemd-formula/compare/v0.12.0...v0.12.1) (2019-05-27)


### Documentation

* **tofs:** apply remaining comments from PR [#37](https://github.com/saltstack-formulas/systemd-formula/issues/37) ([d665676](https://github.com/saltstack-formulas/systemd-formula/commit/d665676))

# [0.12.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.11.0...v0.12.0) (2019-05-26)


### Continuous Integration

* **kichen+travis:** test with pre-salted Docker images ([0e5776c](https://github.com/saltstack-formulas/systemd-formula/commit/0e5776c))


### Features

* **tofs:** lookup files directory in “tpldir” hierarchy ([8d5b5ea](https://github.com/saltstack-formulas/systemd-formula/commit/8d5b5ea))

# [0.11.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.10.0...v0.11.0) (2019-05-13)


### Features

* **semantic-release:** implement an automated changelog ([eed041d](https://github.com/saltstack-formulas/systemd-formula/commit/eed041d))
