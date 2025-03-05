
import 'tiktok_flutter_sdk_platform_interface.dart';

class TiktokFlutterSdk {
  Future<String?> getPlatformVersion() {
    return TiktokFlutterSdkPlatform.instance.getPlatformVersion();
  }
}
