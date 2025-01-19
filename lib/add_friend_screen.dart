import 'package:flutter/material.dart';
import 'package:tencent_chat_sdk_tutorial/profile_screen.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';


class AddFriendScreen extends StatefulWidget {
  @override
  State<AddFriendScreen> createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
      ),
      body: TIMUIKitAddFriend(

        onTapAlreadyFriendsItem: (String userID) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(userId: userID),
              ));
        },),
    );
  }
}


