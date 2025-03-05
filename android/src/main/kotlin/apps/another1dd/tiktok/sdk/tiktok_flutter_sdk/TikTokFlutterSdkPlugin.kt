package apps.another1dd.tiktok.sdk.tiktok_flutter_sdk

import TikTokSDK
import android.app.Activity
import apps.another1dd.tiktok.sdk.tiktok_flutter_sdk.api.TikTokSDKImpl
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

class TikTokFlutterSdkPlugin : FlutterPlugin, ActivityAware {

    private var activity: Activity? = null

    override fun onAttachedToEngine(
        flutterPluginBinding: FlutterPlugin.FlutterPluginBinding
    ) = TikTokSDK.setUp(
        flutterPluginBinding.binaryMessenger,
        TikTokSDKImpl(activity, flutterPluginBinding)
    )

    override fun onDetachedFromEngine(
        binding: FlutterPlugin.FlutterPluginBinding
    ) = TikTokSDK.setUp(binding.binaryMessenger, null)

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }
}
