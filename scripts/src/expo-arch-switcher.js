const fs = require('fs')
const path = require('path')

const dirArgv = process.argv[2]
const fabricArgv = process.argv[3]

if (!dirArgv || !dirArgv.includes('dir=')) {
    throw Error('You need to pass expo folder directory as argument!')
}

const dir = dirArgv.split('=').at(1)
const expoFolderPath = path.resolve('../../examples', dir)

if (!fs.existsSync(expoFolderPath)) {
    throw Error(`Folder: ${expoFolderPath} doesn't exist!`)
}

const appConfigPath = path.resolve(path.resolve(expoFolderPath, './app.json'))

if (!fs.existsSync(appConfigPath)) {
    throw Error(`App.json config under ${appConfigPath} doesn't exist!`)
}

const fabricEnabled = fabricArgv && fabricArgv.includes('fabric') && fabricArgv.split('=').at(1) === '1'

const appConfig = JSON.parse(fs.readFileSync(appConfigPath, { encoding: 'utf-8' }))
const plugins = (appConfig.expo.plugins || []).filter(plugin => plugin !== 'expo-build-properties')

const newConfig = {
    ...appConfig,
    expo: {
        ...appConfig.expo,
        plugins: [
            ...plugins,
            [
                'expo-build-properties',
                {
                    android: {
                        newArchEnabled: fabricEnabled
                    },
                    ios: {
                        newArchEnabled: fabricEnabled
                    }
                }
            ]
        ]
    }
}

fs.writeFileSync(appConfigPath, JSON.stringify(newConfig, null, 2), {
    encoding: 'utf-8'
})
