import React, { useEffect } from 'react'
import { StyleSheet, View, Text } from 'react-native'
import { EasyLibModule } from 'react-native-easy-lib'

const App: React.FunctionComponent = () => {
    useEffect(() => {
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
