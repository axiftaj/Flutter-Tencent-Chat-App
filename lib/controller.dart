
import 'package:flutter/cupertino.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';


class TIMUIKitService {
  // Singleton instance
  static final TIMUIKitService _instance = TIMUIKitService._internal();

  // CoreServices instance
  final CoreServicesImpl _coreInstance = TIMUIKitCore.getInstance();

  // Private constructor
  TIMUIKitService._internal();

  // Factory method to return the singleton instance
  factory TIMUIKitService() {
    return _instance;
  }

  // Initialization method
  void initTIMUIKIT() {
    _coreInstance.init(
      sdkAppID: 20017096, // Replace with your Tencent Cloud Chat application SDKAppID
      loglevel: LogLevelEnum.V2TIM_LOG_DEBUG,
      listener: V2TimSDKListener(
        onConnectFailed: (code, error) {
          debugPrint("Connection failed: $error ($code)");
        },
        onConnectSuccess: () {
          debugPrint("Connected successfully.");
        },
        onConnecting: () {
          debugPrint("Connecting...");
        },
        onKickedOffline: () {
          debugPrint("Kicked offline.");
        },
        onSelfInfoUpdated: (V2TimUserFullInfo info) {
          debugPrint("Self info updated: ${info.toJson()}");
        },
        onUserSigExpired: () {
          print("User signature expired.");
        },
      ),
    );
  }

  // Login method
  Future<void> login(String userID, String userSig) async {
    try {
      final response = await _coreInstance.login(userID: userID, userSig: userSig);
      debugPrint("Login successful: ${response.toJson()}");
    } catch (e) {
      debugPrint("Login failed: $e");
    }
  }
}
