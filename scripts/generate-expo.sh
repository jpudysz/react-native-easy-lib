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
  folder_name="expo_$sdk"
  npx create-expo-app $folder_name -t "expo-template-blank-typescript@sdk-$sdk"
else
  echo "Using most recent SDK"
  folder_name="expo_latest"
  npx create-expo-app $folder_name -t expo-template-blank-typescript
fi

cd $folder_name

app_folder="../shared/app"
expo_folder="../shared/expo"

echo "✂️  Copying shared folder"

cp -rp "$app_folder"/* .
find "$expo_folder" -type f -exec cp -p {} . \;

echo "🔗  Linking native code"

yarn link react-native-easy-lib

# remove main in package.json to point to copied index.js
node -e "const fs = require('fs'); const package = JSON.parse(fs.readFileSync('./package.json')); delete package.main; fs.writeFileSync('./package.json', JSON.stringify(package, null, 2));"

echo "⭐ Done ⭐"
