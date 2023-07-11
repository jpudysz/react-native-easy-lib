const path = require('path')
const { getDefaultConfig } = require('expo/metro-config')

const config = getDefaultConfig(__dirname)
const root = path.resolve(__dirname, '../..')

// eslint-disable-next-line functional/immutable-data
module.exports = {
    ...config,
    projectRoot: __dirname,
    watchFolders: [root],
    resolver: {
        // eslint-disable-next-line camelcase
        unstable_enableSymlinks: true,
        nodeModulesPaths: [
            path.resolve(__dirname, 'node_modules'),
            path.resolve(root, 'node_modules')
        ],
        disableHierarchicalLookup: true
    }
}
