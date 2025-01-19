
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
          print("Connection failed: $error ($code)");
        },
        onConnectSuccess: () {
          print("Connected successfully.");
        },
        onConnecting: () {
          print("Connecting...");
        },
        onKickedOffline: () {
          print("Kicked offline.");
        },
        onSelfInfoUpdated: (V2TimUserFullInfo info) {
          print("Self info updated: ${info.toJson()}");
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
      print("Login successful: ${response.toJson()}");
    } catch (e) {
      print("Login failed: $e");
    }
  }
}
