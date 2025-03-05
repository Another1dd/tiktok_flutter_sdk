package apps.another1dd.tiktok.sdk.tiktok_flutter_sdk.api

import AuthMethod
import TikTokSDK
import android.app.Activity
import com.tiktok.open.sdk.auth.AuthApi
import com.tiktok.open.sdk.auth.AuthRequest
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding

class TikTokSDKImpl(
    private val activity: Activity?,
    private val binding: FlutterPluginBinding
) : TikTokSDK {

    override fun authorize(
        clientKey: String,
        scope: String,
        redirectUri: String,
        codeVerifier: String,
        autoAuthDisabled: Boolean,
        state: String?,
        language: String?,
        authMethod: AuthMethod
    ): Boolean = activity?.let { activity ->
        val authApi = AuthApi(activity = activity)
        val request = AuthRequest(
            clientKey = clientKey,
            scope = scope,
            redirectUri = redirectUri,
            codeVerifier = codeVerifier,
            autoAuthDisabled = autoAuthDisabled,
            state = state,
            language = language
        )

        authApi.authorize(
            request = request,
            authMethod = if (authMethod == AuthMethod.TIK_TOK_APP) {
                AuthApi.AuthMethod.TikTokApp
            } else {
                AuthApi.AuthMethod.ChromeTab
            }
        )
    } ?: false

}
