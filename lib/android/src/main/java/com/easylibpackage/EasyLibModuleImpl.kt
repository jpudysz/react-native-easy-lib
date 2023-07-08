package com.easylibpackage

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build

import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactMethod

class EasyLibModule internal constructor(context: ReactApplicationContext) : EasyLibModuleSpec(context) {
    override fun getName(): String {
         return NAME
    }

    companion object {
        const val NAME = "EasyLibModule"
    }

    @ReactMethod(isBlockingSynchronousMethod = true)
    override fun syncFunction(): Boolean {
        return true
    }

    @ReactMethod()
    override fun asyncFunction(promise: Promise) {
        promise.resolve(true)
    }
}
