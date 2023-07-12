version=${args[version]}
fabric=${args[--fabric]}

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

app_folder="../shared/app"
bare_folder="../shared/bare"

echo "✂️  Copying shared folder"

cp -rp "$app_folder"/* .
find "$bare_folder" -type f -exec cp -p {} . \;

RCT_NEW_ARCH_ENABLED=$fabric npx pod-install

if [[ "$fabric" == 1 ]]; then
  echo "🚀 Enabling new architecture"
fi

node ../../scripts/src/bare-arch-switcher.js dir=$folder_name fabric=$fabric

echo "⭐ Done ⭐"
