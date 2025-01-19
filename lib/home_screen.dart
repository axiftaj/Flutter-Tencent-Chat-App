


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tencent_chat_sdk_tutorial/controller.dart';
import 'package:tencent_chat_sdk_tutorial/add_friend_screen.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/view_models/tui_chat_global_model.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'dart:developer' as log;

import 'chat_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final message = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Message",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddFriendScreen(),
              ),
            );
          }, icon: Icon(Icons.add_box_outlined))
        ],
      ),
      body: SafeArea(
        child: TIMUIKitConversation(
          // itemBuilder: (V2TimConversation conversationItem, [V2TimUserStatus? onlineStatus]){
          //     log.log(encode(conversationItem.toJson()).toString());
          //   return ListTile(
          //
          //     title: Text(conversationItem.showName.toString()),
          //     subtitle: Text(conversationItem.lastMessage!.textElem!.text.toString()),
          //   );
          // },
          onTapItem: (conversation) {
            //log.log(encode(conversation.conversationID).toString());
            // Navigate to the chat screen with the selected conversation

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatV2(
                    selectedConversation: conversation,
                    initFindingMsg: conversation.lastMessage),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<int> delay()async{
    await Future.delayed(Duration(seconds: 2));
    return 0;
  }
}






