import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/tiktok.sdk.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/apps/another1dd/tiktok/sdk/tiktok_flutter_sdk/api/TikTokSDK.g.kt',
    kotlinOptions: KotlinOptions(errorClassName: "TikTokFlutterSDKError"),
    swiftOut: 'ios/Classes/Api/TikTokSDK.g.swift',
    swiftOptions: SwiftOptions(errorClassName: "TikTokFlutterSDKError"),
  ),
)
@HostApi()
abstract class TikTokSDK {
  bool authorize(
    String clientKey,
    String scope,
    String redirectUri,
    String codeVerifier, {
    bool autoAuthDisabled = false,
    String? state,
    String? language,
    AuthMethod authMethod = AuthMethod.tikTokApp,
  });
}

enum AuthMethod { chromeTab, tikTokApp }
