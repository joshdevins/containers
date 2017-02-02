#!/bin/bash

set -e
set -u

usage() {
  echo "Launches a notebook with the provided working directory."
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
      work=$1
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

: ${work:?}

# launches the default command which is the Jupyter notebook
docker run \
  -it \
  --rm \
  -p 8888:8888 \
  -v ${work}:${work}:rw \
  joshdevins/data-science \
  start-notebook.sh --NotebookApp.token='' --NotebookApp.base_url=${work}
