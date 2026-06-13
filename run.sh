#!/bin/bash

case "$1" in
  build_generator)
    docker build -t hw3-generator ./generator
    ;;

  run_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" hw3-generator
    ;;

  create_local_data)
    mkdir -p local_data
    python generator/generate.py local_data
    ;;

  build_reporter)
    docker build -t hw3-reporter ./reporter
    ;;

  run_reporter)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" hw3-reporter
    ;;

  *)
    echo "Unknown command: $1"
    echo "Available commands: build_generator, run_generator, create_local_data, build_reporter, run_reporter"
    exit 1
    ;;
esac