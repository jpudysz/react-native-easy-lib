const path = require('path')
const { getDefaultConfig } = require('expo/metro-config')

const config = getDefaultConfig(__dirname);
const root = path.resolve(__dirname, '../..')

config.projectRoot = __dirname
config.watchFolders = [root]
config.resolver = {
    unstable_enableSymlinks: true,
    nodeModulesPaths: [
        path.resolve(__dirname, 'node_modules'),
        path.resolve(root, 'node_modules'),
    ],
    disableHierarchicalLookup: true
}

module.exports = config;
