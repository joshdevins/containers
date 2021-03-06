#!/bin/bash

set -eu

WORKDIR="$(pwd -P)"

usage() {
  echo "Launches a notebook, from the provided working directory (optional)."
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

# launches the default command which is the Jupyter notebook
docker run \
  -it \
  --rm \
  -p 8181:8888 \
  -v $WORKDIR:/home/jovyan/work:rw \
  joshdevins/data-science \
  start-notebook.sh --NotebookApp.token=''
