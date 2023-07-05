import { NativeModules } from 'react-native'

// @ts-expect-error
const isTurboModuleEnabled = global.__turboModuleProxy !== null // eslint-disable-line no-underscore-dangle
const IsEasyLibModule = isTurboModuleEnabled
    ? require('./NativeEasyLib').default
    : NativeModules.EasyLib

const EasyLibModule = IsEasyLibModule
    ? IsEasyLibModule
    : new Proxy(
        {},
        {
            get: () => {
                throw new Error(`The package 'react-native-easy-lib' doesn't seem to be linked`)
            }
        }
    )

export const syncFunction = (): boolean => EasyLibModule.syncFunction()
export const asyncFunction = (): Promise<boolean> => EasyLibModule.asyncFunction()
