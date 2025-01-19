

import 'package:flutter/material.dart';
import 'package:tencent_chat_sdk_tutorial/controller.dart';
import 'package:tencent_chat_sdk_tutorial/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final userId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: userId,
              decoration: InputDecoration(
                hintText: 'Enter id' ,
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              final timService = TIMUIKitService();

              // Initialize the SDK
              timService.initTIMUIKIT();

              // Perform login for different users

              timService.login(
                userId.text,
                '',
              ).then((vak){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              });

            }, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
