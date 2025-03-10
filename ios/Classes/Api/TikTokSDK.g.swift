// Autogenerated from Pigeon (v24.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class TikTokFlutterSDKError: Error {
  let code: String
  let message: String?
  let details: Sendable?

  init(code: String, message: String?, details: Sendable?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "TikTokFlutterSDKError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? TikTokFlutterSDKError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum AuthMethod: Int {
  case chromeTab = 0
  case tikTokApp = 1
}

private class TikTokSDKPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 129:
      let enumResultAsInt: Int? = nilOrValue(self.readValue() as! Int?)
      if let enumResultAsInt = enumResultAsInt {
        return AuthMethod(rawValue: enumResultAsInt)
      }
      return nil
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class TikTokSDKPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? AuthMethod {
      super.writeByte(129)
      super.writeValue(value.rawValue)
    } else {
      super.writeValue(value)
    }
  }
}

private class TikTokSDKPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return TikTokSDKPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return TikTokSDKPigeonCodecWriter(data: data)
  }
}

class TikTokSDKPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = TikTokSDKPigeonCodec(readerWriter: TikTokSDKPigeonCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol TikTokSDK {
  func authorize(clientKey: String, scope: String, redirectUri: String, codeVerifier: String, autoAuthDisabled: Bool, state: String?, language: String?, authMethod: AuthMethod) throws -> Bool
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class TikTokSDKSetup {
  static var codec: FlutterStandardMessageCodec { TikTokSDKPigeonCodec.shared }
  /// Sets up an instance of `TikTokSDK` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: TikTokSDK?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let authorizeChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.tiktok_flutter_sdk.TikTokSDK.authorize\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      authorizeChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let clientKeyArg = args[0] as! String
        let scopeArg = args[1] as! String
        let redirectUriArg = args[2] as! String
        let codeVerifierArg = args[3] as! String
        let autoAuthDisabledArg = args[4] as! Bool
        let stateArg: String? = nilOrValue(args[5])
        let languageArg: String? = nilOrValue(args[6])
        let authMethodArg = args[7] as! AuthMethod
        do {
          let result = try api.authorize(clientKey: clientKeyArg, scope: scopeArg, redirectUri: redirectUriArg, codeVerifier: codeVerifierArg, autoAuthDisabled: autoAuthDisabledArg, state: stateArg, language: languageArg, authMethod: authMethodArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      authorizeChannel.setMessageHandler(nil)
    }
  }
}
