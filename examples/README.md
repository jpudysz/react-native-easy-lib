## Examples

### Where are the examples?

In order to speed up the tests and upgrade process, examples are generated dynamically. You can generate your own example with following commands:

```shell
# generate example with most recent version of bare React Native
yarn generate:example bare

# generate example with specified React Native version
yarn generate:example bare --version 0.72.0

# generate example with most recent expo version
yarn generate:example expo

# generate example with specified Expo SDK
yarn generate:example expo --sdk 49

# enable new architecture
yarn generate:example bare --fabric

# check all the options with
yarn generate:example --help
```
Following scripts will automatically copy shared code from `shared` folder and link your native library. 🧙

### Limitations:

* React Native >= 0.72
* Expo SDK 49 or lower Expo SDK with React Native 0.72
