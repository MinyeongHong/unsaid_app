package com.oyoung.unsaid

import com.oyoung.unsaid.BuildConfig
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

fun initFlavor(mainActivity: MainActivity, flutterEngine: FlutterEngine) {
  MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "flavor")
    .setMethodCallHandler { _, result ->
      result.success(BuildConfig.FLAVOR)
    }
}