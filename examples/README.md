## Examples

### Where are the examples?

In order to speed up the tests and upgrade process, examples are generated dynamically. You can generate your own example with following commands:

```shell
# generate example with most recent version of bare React Native
yarn generate:example bare

# generate example with specified React Native version
yarn generate:example bare 0.72.0

# generate example with most recent expo version
yarn generate:example expo

# generate example with specified Expo SDK
yarn generate:example expo 49

# enable new architecture
yarn generate:example bare --fabric

# check all the options with
yarn generate:example --help
```
Following scripts will automatically copy shared code from `shared` folder and link your native library. 🧙

### Switch between new/old archirecture

#### Expo

1. Go to `./examples/expo_${version}/app.json`
2. Search for `plugins` and `expo-build-properties`
3. Switch `newArchEnabled` config to enable/disable new architecture:

```json
{
    "expo": {
        "plugins": [
            [
                "expo-build-properties",
                {
                    "android": {
                        "newArchEnabled": true
                    },
                    "ios": {
                        "newArchEnabled": true
                    }
                }
            ]
        ]
    }
}
```
4. Prebuild new native folders:

```shell
yarn expo prebuild --clean
```

5. Run your app with:
```shell
yarn expo run:ios
yarn expo run:android
```

#### Bare
1. For iOS go to `./examples/bare_${version}/ios` and run:

```shell
RCT_NEW_ARCH_ENABLED=1 pod install #use 0 to switch back to old architecture
```
2. For Android go to `./examples/bare_${version}/android/gradle.properties` and look for `newArchEnabled` property:

```
newArchEnabled=false
```

3. After the change run the script in `android` folder:

```shell
./gradlew clean
```
4. Run your app with:
```shell
yarn ios
yarn android
```

### Limitations:

* React Native >= 0.72
* Expo SDK 49 or lower Expo SDK with React Native 0.72
