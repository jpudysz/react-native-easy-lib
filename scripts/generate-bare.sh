#!/bin/bash
if [ "$1" = "--help" ]; then
  echo "--version <version_number> - install specific version of React Native"
  exit 0
fi

echo "👾 Generating example project with bare React Native 👾"

if [ "$1" = "--version" ]; then
  if [ $# -lt 2 ] || [ -z "$2" ]; then
      echo "Invalid argument. Check available arguments with --help"
      exit 1
  else
      version="$2"
  fi
else
    if ! [ $# -eq 0 ]; then
      echo "Invalid argument. Check available arguments with --help"
      exit 1
    fi
fi

echo "🗑️ Cleanup examples/bare"
cd examples
rm -rf bare_*

echo "⚛️ Install new React Native project"

if [ -n "$version" ]; then
  echo "Using version $version"
  npx react-native init "bare_$(echo "$version" | cut -d '.' -f 2)" --version $version
else
  echo "Using most recent version"
  npx react-native init bare_latest
fi

# todo copy shared, link library


