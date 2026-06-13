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

  structure)
    find . -print
    ;;

  clear_data)
    mkdir -p data
    rm -f data/*.csv data/*.html
    ;;

  inside_generator)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" hw3-generator ls -la /data
    ;;

  inside_reporter)
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" hw3-reporter ls -la /data
    ;;

  *)
    echo "Unknown command: $1"
    echo "Available commands: build_generator, run_generator, create_local_data, build_reporter, run_reporter, structure, clear_data, inside_generator, inside_reporter"
    exit 1
    ;;
esac