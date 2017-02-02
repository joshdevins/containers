#!/bin/bash

set -e

# check for installed binaries
for binary in zip make python
do
  which $binary 1> /dev/null || (echo [FAIL] $binary not found && exit 1)
  echo [PASS] $binary found
done

# check python
python -c "print 'Ameisenscheiße'" 1> /dev/null || (echo [FAIL] python not working && exit 1)
echo [PASS] python is working

# check numpy
python -c "import numpy" || (echo [FAIL] cannot import numpy in python && exit 1)
echo [PASS] numpy is working
