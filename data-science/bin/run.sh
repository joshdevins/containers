#!/bin/bash

set -eu

WORKDIR="$(pwd -P)"

usage() {
  echo "Runs an arbitrary command in the container, from the provided working directory (optional)."
  echo
  echo "Usage: $0 [options]"
  echo
  echo "Options:"
  echo "  -h | --help  see this dialog"
  echo "  -w | --work  working directory (e.g. '/Users/josh/source/joshdevins/project')"
}

while test "$#" -gt 0
do
  case "$1" in
    --help|-h)
      usage
      exit 0
      ;;
    --work|-w)
      shift
      WORKDIR=$1
      shift
      ;;
    --) # End of all options
      shift
      break
      ;;
    -*)
      echo "Error: Unknown option: $1" >&2
      exit 1
      ;;
    *) # No more options
      break
      ;;
  esac
done

: ${WORKDIR:?}

if [[ -z "$@" ]]
then
  echo "[ERROR] No command provided"
  echo
  usage
  exit 1
fi

docker run \
  --rm \
  -v $WORKDIR:$WORKDIR \
  -w $WORKDIR \
  -e HOME=$WORKDIR \
  joshdevins/data-science:latest \
  start.sh $@
