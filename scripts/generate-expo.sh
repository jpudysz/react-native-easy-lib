#!/bin/bash
if [ "$1" = "--help" ]; then
  echo "--sdk <sdk> - install specific version of Expo SDK"
  exit 0
fi

echo "👾 Generating example project with Expo 👾"

if [ "$1" = "--sdk" ]; then
  if [ $# -lt 2 ] || [ -z "$2" ]; then
      echo "Invalid argument. Check available arguments with --help"
      exit 1
  else
      sdk="$2"
  fi
else
    if ! [ $# -eq 0 ]; then
      echo "Invalid argument. Check available arguments with --help"
      exit 1
    fi
fi

echo "🗑️ Cleanup examples/expo"
cd examples
rm -rf expo_*

echo "⚛️ Install new Expo project"

if [ -n "$sdk" ]; then
  echo "Using SDK $sdk"
  npx create-expo-app "expo_$sdk" -t "expo-template-blank-typescript@sdk-$sdk"
else
  echo "Using most recent SDK"
  npx create-expo-app expo_latest -t expo-template-blank-typescript
fi

# todo copy shared, link library



