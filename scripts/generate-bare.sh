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

echo "🗑️  Cleanup examples/bare"
cd examples
rm -rf bare_*

echo "⚛️  Install new React Native project"

if [ -n "$version" ]; then
  echo "Using version $version"
  folder_name="bare_$(echo "$version" | cut -d '.' -f 2)"
  npx react-native init $folder_name --version $version
else
  echo "Using most recent version"
  folder_name="bare_latest"
  npx react-native init $folder_name
fi

cd $folder_name

shared_folder="../shared/bare"

echo "✂️  Copying shared folder"

find "$shared_folder" -type f -exec cp -p {} . \;

echo "🔗  Linking native code"

yarn link react-native-easy-lib
npx pod-install

echo "⭐ Done ⭐"
