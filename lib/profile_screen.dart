import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitProfile/profile_widget.dart';

import 'dart:developer' as log;

class ProfileScreen extends StatefulWidget {
  final String userId ;
  const ProfileScreen({super.key , required this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    print('hello');
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
          sendMessage(widget.userId , 'Hello') ;

    }, icon: Icon(Icons.send))
        ],
      ),
      body: TIMUIKitProfile(
          userID: widget.userId ,

      profileWidgetBuilder: ProfileWidgetBuilder(
        customBuilderOne: ( a,info, con){
          return TextButton(onPressed: (){

          }, child: Text('Send Message' , style: TextStyle(color: Colors.red),));
        },
      ),
       ),
    );
  }

  Future<void> sendMessage(String receiver, String text) async {
    // Step 1: Create the message

    V2TimValueCallback<V2TimMsgCreateInfoResult> messageResult =
    await TencentImSDKPlugin.v2TIMManager
        .getMessageManager()
        .createTextMessage(text: text);

    log.log(encode(messageResult.data!.toJson()));
    log.log(messageResult.data!.id.toString());
    if (messageResult.code == 0) {
    } else {
      print("Failed to create message: ${messageResult.desc}");
    }


    if (messageResult.data != null && messageResult.data!.id != null) {


      // Step 2: Send the created message
      V2TimValueCallback<V2TimMessage> result =
      await TencentImSDKPlugin.v2TIMManager.getMessageManager().sendMessage(
        id: messageResult.data!.id.toString(), // Use msgID from the created message
        receiver: receiver, // Receiver's userID
        groupID: '', // Leave empty for one-on-one chat
      );

      if (result.code == 0) {
        print("Message sent successfully: ${result.data}");
      } else {
        print("Failed to send message: ${result.desc}");
      }
    } else {
      print("Message creation failed");
    }


  }

}
