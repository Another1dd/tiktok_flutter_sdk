import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tiktok_flutter_sdk_platform_interface.dart';

/// An implementation of [TiktokFlutterSdkPlatform] that uses method channels.
class MethodChannelTiktokFlutterSdk extends TiktokFlutterSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tiktok_flutter_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
