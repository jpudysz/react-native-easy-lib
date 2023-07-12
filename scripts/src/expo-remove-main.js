const fs = require('fs')

const { main, ...packageJSON } = JSON.parse(fs.readFileSync('./package.json', { encoding: 'utf-8' }))

fs.writeFileSync('./package.json', JSON.stringify(packageJSON, null, 2), {
    encoding: 'utf-8'
})
