import { NativeModules, Platform } from 'react-native'

const LINKING_ERROR =
    `The package 'react-native-easy-lib' doesn't seem to be linked. Make sure: \n\n` +
    Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
    '- You rebuilt the app after installing the package\n' +
    '- You are not using Expo Go\n'

// @ts-expect-error
const isTurboModuleEnabled = global.__turboModuleProxy != null
const IsEasyLibModule = isTurboModuleEnabled
    ? require('./NativeEasyLib').default
    : NativeModules.EasyLib

const EasyLibModule = IsEasyLibModule
    ? IsEasyLibModule
    : new Proxy(
        {},
        {
            get() {
                throw new Error(LINKING_ERROR)
            }
        }
    )

export const syncFunction = (): boolean => EasyLibModule.syncFunction()
export const asyncFunction = (): Promise<boolean> => EasyLibModule.asyncFunction()
