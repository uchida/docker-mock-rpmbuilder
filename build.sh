#!/bin/bash
set -e

if [ -z "$MOCK_CONFIG" ]; then
  echo "specify MOCK_CONFIG environment variable from one of the following"
  ls -l /etc/mock
  exit 1
fi

buildsrpm() {
  local spec=$1
  spectool -g -C /rpmbuild/SOURCES $spec
  /usr/bin/mock -r $MOCK_CONFIG --buildsrpm --spec $spec --sources /rpmbuild/SOURCES --resultdir /rpmbuild/output
}

rebuildrpm() {
  local srpm=$1
  /usr/bin/mock -r $MOCK_CONFIG --rebuild $srpm --resultdir /rpmbuild/output
}

mkdir -p /rpmbuild/output

case $MOCK_TARGET in
  SPECS)
    mkdir -p /rpmbuild/SOURCES
    for f in $(find /rpmbuild/SPECS -type f -name '*.spec'); do
      buildsrpm $f
    done
    for f in $(find /rpmbuild/output -type f -name '*.src.rpm'); do
      rebuildrpm $f
    done
    ;;
  SRPMS)
    for f in $(find /rpmbuild/SRPMS -type f -name '*.src.rpm'); do
      rebuildrpm $f
    done
    ;;
  *)
    echo "specify MOCK_TARGET environment variable from one of 'SPECS', 'SOURCES'"
    ;;
esac
