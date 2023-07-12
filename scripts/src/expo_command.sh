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

npx expo install expo-build-properties

if [[ "$fabric" == 1 ]]; then
  echo "🚀 Enabling new architecture"
fi

node ../../scripts/src/expo-arch-switcher.js dir=$folder_name fabric=$fabric
node ../../scripts/src/expo-remove-main.js
cd android && ./gradlew generateCodegenArtifactsFromSchema && cd ..

echo "⭐ Done ⭐"
