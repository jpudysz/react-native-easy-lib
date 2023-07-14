import { TurboModule, TurboModuleRegistry } from 'react-native'

export interface Spec extends TurboModule {
    syncFunction(): boolean,
    asyncFunction(): Promise<boolean>
}

export default TurboModuleRegistry.getEnforcing<Spec>('EasyLibModule')
