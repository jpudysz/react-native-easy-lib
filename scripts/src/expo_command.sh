# todo handle fabric flag
sdk=${args[sdk]}
fabric=${args[--fabric]}

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
