#! /usr/bin/env bash

if [ $0 != "./bin/run.sh" ]; then
  echo "ERROR: you must run this from the root of the repo as ./bin/run.sh" 1>&2
  exit 1
fi

if ! [ -d ./spec ]; then
  echo "ERROR: ./spec does not exist--has a day been initialized?" 1>&2
  exit 1
fi

last_spec=$(find ./spec/ -regex '.*aoc[0-9]*-day[0-9]*_spec.rb' | sort | tail -n1)
cmd="rspec --format doc $last_spec"
echo ":: running: $cmd"
$cmd

