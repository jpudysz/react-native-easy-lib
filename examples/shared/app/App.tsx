import React, { useEffect } from 'react'
import { StyleSheet, View, Text } from 'react-native'
import { EasyLibModule } from 'react-native-easy-lib'

type AppProps = {
    concurrentRoot?: boolean
}

const App: React.FunctionComponent<AppProps> = ({ concurrentRoot }) => {
    useEffect(() => {
        console.log(`Fabric is ${concurrentRoot ? 'enabled' : 'disabled'}`)

        EasyLibModule.asyncFunction()
            .then(() => console.log('Async function works too!'))
    }, [])

    return (
        <View style={styles.container}>
            <Text>
                Does it work? {EasyLibModule.syncFunction() ? 'yes' : 'nope'}
            </Text>
        </View>
    )
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    }
})

export default App
