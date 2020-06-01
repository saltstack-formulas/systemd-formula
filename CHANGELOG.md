# Changelog

# [0.16.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.15.0...v0.16.0) (2020-06-01)


### Continuous Integration

* **kitchen+travis:** use latest pre-salted images ([a531d38](https://github.com/saltstack-formulas/systemd-formula/commit/a531d38464eadef87802fa5a76ec5bfdad6199bd))


### Features

* **python3:** update for `ubuntu-20.04` & `fedora-32` ([7e719e0](https://github.com/saltstack-formulas/systemd-formula/commit/7e719e0637700e99d3e85d888390ea10cc93dd6b))

# [0.15.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.14.2...v0.15.0) (2020-05-25)


### Continuous Integration

* **gemfile.lock:** add to repo with updated `Gemfile` [skip ci] ([ff5d8b8](https://github.com/saltstack-formulas/systemd-formula/commit/ff5d8b897f5c4cdcb30f1f2a3f8e1b516360825a))
* **kitchen+travis:** remove `master-py2-arch-base-latest` [skip ci] ([e75b92c](https://github.com/saltstack-formulas/systemd-formula/commit/e75b92c033242c69564719c803ffbdce54aa3b75))
* **travis:** add notifications => zulip [skip ci] ([92827e9](https://github.com/saltstack-formulas/systemd-formula/commit/92827e9e3ee0f3a3a0d6620f7bb517b69609c3b8))
* **workflows/commitlint:** add to repo [skip ci] ([dbdb414](https://github.com/saltstack-formulas/systemd-formula/commit/dbdb4147def0b8934e09ebc5e74b767a04db8cf9))


### Features

* **unit:** allow to start/stop, enable/disable services ([5f7d854](https://github.com/saltstack-formulas/systemd-formula/commit/5f7d854f76f964fdaea6a5f56960343b48c72310))

## [0.14.2](https://github.com/saltstack-formulas/systemd-formula/compare/v0.14.1...v0.14.2) (2020-04-18)


### Bug Fixes

* **centos-8:** fix systemd-networkd package installation ([f2025e3](https://github.com/saltstack-formulas/systemd-formula/commit/f2025e32a585ceb6a635ac92f66a3511cd167d34))

## [0.14.1](https://github.com/saltstack-formulas/systemd-formula/compare/v0.14.0...v0.14.1) (2020-03-30)


### Bug Fixes

* **libtofs:** “files_switch” mess up the variable exported by “map.jinja” [skip ci] ([6dadf5d](https://github.com/saltstack-formulas/systemd-formula/commit/6dadf5dce2c1ef85b46cb812ef7bb2f12772cdb1))
* **release.config.js:** use full commit hash in commit link [skip ci] ([bfad0ce](https://github.com/saltstack-formulas/systemd-formula/commit/bfad0ce6cee76e78818f25811e2e3162339cbdde))


### Continuous Integration

* **kitchen:** reinstall `udev` since removed from pre-salted images ([1e99a6f](https://github.com/saltstack-formulas/systemd-formula/commit/1e99a6f6864ff7bdf3853356d6352fd269b448fc))
* workaround issues with newly introduced `amazonlinux-1` [skip ci] ([a7fe651](https://github.com/saltstack-formulas/systemd-formula/commit/a7fe6515d043490a37d1f92125060392586d8013))
* **gemfile:** restrict `train` gem version until upstream fix [skip ci] ([abb7c16](https://github.com/saltstack-formulas/systemd-formula/commit/abb7c16ec3b2d61ea3eb1c799f04acb018aebf3a))
* **kitchen:** avoid using bootstrap for `master` instances [skip ci] ([6c4e811](https://github.com/saltstack-formulas/systemd-formula/commit/6c4e81151f6cf1bb0638714038c6a772bfc7e9c2))
* **kitchen:** use `debian-10-master-py3` instead of `develop` [skip ci] ([baaf5b3](https://github.com/saltstack-formulas/systemd-formula/commit/baaf5b3718359228a7d855f939ae941a71ec66d6))
* **kitchen:** use `develop` image until `master` is ready (`amazonlinux`) [skip ci] ([b14b414](https://github.com/saltstack-formulas/systemd-formula/commit/b14b414c90022375136daa064b1c95b802d79c53))
* **kitchen+travis:** upgrade matrix after `2019.2.2` release [skip ci] ([0fff6ac](https://github.com/saltstack-formulas/systemd-formula/commit/0fff6ac6fdbc22321e62ba7dd4493543fead95cb))
* **travis:** apply changes from build config validation [skip ci] ([910654e](https://github.com/saltstack-formulas/systemd-formula/commit/910654e43ecd1b546f295ea97482fb7080960227))
* **travis:** opt-in to `dpl v2` to complete build config validation [skip ci] ([9cbaced](https://github.com/saltstack-formulas/systemd-formula/commit/9cbaced8a330f08ec2d6af8c728bc182edc5e8a7))
* **travis:** quote pathspecs used with `git ls-files` [skip ci] ([0a2547c](https://github.com/saltstack-formulas/systemd-formula/commit/0a2547c11339ad47684d67bd139de3c715477cd9))
* **travis:** run `shellcheck` during lint job [skip ci] ([90976bb](https://github.com/saltstack-formulas/systemd-formula/commit/90976bb934571ed5ac09d8dafb1778ef1592d094))
* **travis:** update `salt-lint` config for `v0.0.10` [skip ci] ([788b9ae](https://github.com/saltstack-formulas/systemd-formula/commit/788b9aee583f9d262893a7b98c05797011e7ca87))
* **travis:** use `major.minor` for `semantic-release` version [skip ci] ([59f1b38](https://github.com/saltstack-formulas/systemd-formula/commit/59f1b3871f07359ce46742ecb7a86b4b5f0162e0))
* **travis:** use build config validation (beta) [skip ci] ([dfa502a](https://github.com/saltstack-formulas/systemd-formula/commit/dfa502ae7d3f5f2b2c9e1714f99e7bfc91c011f0))


### Performance Improvements

* **travis:** improve `salt-lint` invocation [skip ci] ([0da36bb](https://github.com/saltstack-formulas/systemd-formula/commit/0da36bbcbbef3dbe8776b291ef3c7c96fd9888d1))

# [0.14.0](https://github.com/saltstack-formulas/systemd-formula/compare/v0.13.3...v0.14.0) (2019-10-19)


### Documentation

* **contributing:** remove to use org-level file instead [skip ci] ([](https://github.com/saltstack-formulas/systemd-formula/commit/9bf7026))
* **readme:** update link to `CONTRIBUTING` [skip ci] ([](https://github.com/saltstack-formulas/systemd-formula/commit/dfbd9e9))


### Features

* **centos-8:** support centos 8 ([](https://github.com/saltstack-formulas/systemd-formula/commit/7125240))

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
