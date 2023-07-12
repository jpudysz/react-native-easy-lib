package com.easylibpackage

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.Promise

abstract class EasyLibModuleSpec internal constructor(context: ReactApplicationContext) : ReactContextBaseJavaModule(context) {
    abstract fun syncFunction(): Boolean
    abstract fun asyncFunction(promise: Promise)
}
