const { getDefaultConfig, mergeConfig } = require('@react-native/metro-config')

const path = require('path')
const root = path.resolve(__dirname, '../..')

const config = {
    projectRoot: __dirname,
    watchFolders: [root],
    resolver: {
        // eslint-disable-next-line camelcase
        unstable_enableSymlinks: true
    }
}

// eslint-disable-next-line functional/immutable-data
module.exports = mergeConfig(getDefaultConfig(__dirname), config)
