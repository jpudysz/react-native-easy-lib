const fs = require('fs')
const path = require('path')

const dirArgv = process.argv[2]
const fabricArgv = process.argv[3]

if (!dirArgv || !dirArgv.includes('dir=')) {
    throw Error('You need to pass bare folder directory as argument!')
}

const dir = dirArgv.split('=').at(1)
const bareFolderPath = path.resolve('../../examples', dir)

if (!fs.existsSync(bareFolderPath)) {
    throw Error(`Folder: ${bareFolderPath} doesn't exist!`)
}

const gradlePropertiesPath = path.resolve(path.resolve(bareFolderPath, './android/gradle.properties'))

if (!fs.existsSync(gradlePropertiesPath)) {
    throw Error(`gradle.properties file under ${gradlePropertiesPath} doesn't exist!`)
}

const fabricEnabled = fabricArgv && fabricArgv.includes('fabric') && fabricArgv.split('=').at(1) === '1'

const gradleProperties = fs.readFileSync(gradlePropertiesPath, {
    encoding: 'utf-8'
})

const newGradleProperties = gradleProperties
    .replace(/newArchEnabled=.*/, `newArchEnabled=${fabricEnabled}`)

fs.writeFileSync(gradlePropertiesPath, newGradleProperties, {
    encoding: 'utf-8'
})
