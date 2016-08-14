# docker-mock-rpmbuilder

[![License](https://img.shields.io/github/license/uchida/docker-mock-rpmbuilder.svg?maxAge=2592000)](https://tldrlegal.com/license/creative-commons-cc0-1.0-universal)
[![MicroBadger](https://images.microbadger.com/badges/image/auchida/mock-rpmbuilder.svg)](http://microbadger.com/images/auchida/mock-rpmbuilder)

Build RPMs from `rpmbuild/{SPECS,SRPMS}` with mock, clean room builder for RedHat Enterprise Linxu derivative distributions.

Docker image is available as [auchida/mock-rpmbuilder](https://hub.docker.com/r/auchida/mock-rpmbuilder/) in [Docker Hub](https://hub.docker.com/).

## Examples to build RPM packages

To rebuild packages from `*.src.rpms` under the `/path/to/rpmbuild/SRPMS/` for `epel-6-x86_64` environment.

```console
$ docker run -e MOCK_CONFIG=epel-6-x86_64 -e MOCK_TARGET=SRPMS -v /path/to/rpmbuild:/rpmbuild --privileged=true -i auchida/mock-rpmbuilder
```

To build packages from `*.spec` under the `/path/to/rpmbuild/SPECS/` for `epel-6-x86_64` environment.

```console
$ docker run -e MOCK_CONFIG=epel-6-x86_64 -e MOCK_TARGET=SPECS -v /path/to/rpmbuild:/rpmbuild --privileged=true -i auchida/mock-rpmbuilder
```

## License

Dockerfile and build scripts is dedicated to [![CC0 public domain](http://i.creativecommons.org/p/zero/1.0/80x15.png "CC0 public domain")](https://creativecommons.org/publicdomain/zero/1.0/).
No rights reserved.

License for distributed Docker images follows one of [Fedora Project](https://fedoraproject.org) and installed packages.
