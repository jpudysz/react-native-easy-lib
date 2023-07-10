## [WIP] React Native Easy Library

**Experience the power of beeing native**

Template shows minimal monorepo setup designed to generate React Native libraries with codegen support.

By leveraging this setup, you can significantly reduce development time as it automates the upgrade process. For more in-depth instructions, please refer to the `examples` folder.

You can dive straight into developing your native library using `Swift` and `Kotlin` without worrying about the configuration.

Repo provides a minimal setup for one synchronous function and one asynchronous function, allowing you to quickly get started on building your library.

### Alpha
- [x] Basic CLI for bare/expo
- [x] Swift support
- [x] Kotlin support
- [x] Linting
- [x] Release it / commit lint
- [x] Basic docs
- [x] Working POC

### Beta
- [x] use bashly to improve sh scripts
- [x] add info about examples limitions - RN 72.0 with new metro bundler
- [ ] enable linting for examples/shared
- [x] add docs for examples
- [ ] test with one native module eg. react-native-is-maestro
- [ ] add example with Native View
- [ ] test / add scripts with Fabric

### RC
- [ ] add generator to generate new library module/view
- [ ] validate and test all features
- [ ] create and publish new library based on generator
- [ ] add more docs
- [ ] basic tests for JavaScript / iOS / Android
- [ ] limit sh scripts to specifics min versions (0.72)
- [ ] add cool logo / publish!
