## Examples

### Where are the examples?

In order to speed up the tests and upgrade process, examples are generated dynamically. You can generate your own example with two commands:

```shell
# generate example with most recent version of bare React Native
yarn generate:bare

# generate example with specified React Native version
yarn generate:bare --version 0.71.0

# generate example with most recent expo version
yarn generate:expo

# generate example with specified Expo SDK
yarn generate:expo --sdk 48
```
Following scripts will automatically copy shared code from `shared` folder and link your native library. 🧙
