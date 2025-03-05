import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tiktok_flutter_sdk_method_channel.dart';

abstract class TiktokFlutterSdkPlatform extends PlatformInterface {
  /// Constructs a TiktokFlutterSdkPlatform.
  TiktokFlutterSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static TiktokFlutterSdkPlatform _instance = MethodChannelTiktokFlutterSdk();

  /// The default instance of [TiktokFlutterSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelTiktokFlutterSdk].
  static TiktokFlutterSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TiktokFlutterSdkPlatform] when
  /// they register themselves.
  static set instance(TiktokFlutterSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
