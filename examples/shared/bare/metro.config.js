const {getDefaultConfig, mergeConfig} = require('@react-native/metro-config');
const path = require('path')
/**
 * Metro configuration
 * https://facebook.github.io/metro/docs/configuration
 *
 * @type {import('metro-config').MetroConfig}
 */
const root = path.resolve(__dirname, '../..')

const config = {
    projectRoot: __dirname,
    watchFolders: [root],
    resolver: {
        unstable_enableSymlinks: true
    },
};

module.exports = mergeConfig(getDefaultConfig(__dirname), config);
