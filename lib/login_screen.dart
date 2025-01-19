

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
              print(userId.text == 'axiftaj');

              // Perform login for different users
              if(userId.text == 'axiftaj'){
                timService.login(
                  userId.text,
                  'eJwtjMEKgkAURf-lrUOfE5M20KagFhUYKha4GXMcnlEMjpQW-XumLu85l-OB*BA5T1WDAOYgzIZNhXo0VNKAZUtlI6tJ2eImjaECBEP0fFwuRq5aQ7UC4XHOe4Mjbej*Z-68PzL0gqlBuu-u1phqTbwOrOn2F5Ncw00Yn6v83Z2qzN3qY5K5JXulEctcu4LvDwKAMyQ_',
                ).then((vak){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                });
              }else {
                timService.login(
                  'kaxhiftaj',
                  'eJwtjMEKgkAURf-lbQt9mjYpuAgkyNqZWOBmdEZ7DoXaUFL075m6vOdczgdOx9h4yg58sA2E5bhJyLumkkaseH*lUvN6lg*heNOQAN9GtBh664nLvqFOgm*5rjsYnKim25*x1XB0PGbPDaqGcojR7n2oNzwzld6*iuQc7oucYVUnC5brNoxbjJzMFKlKLwF8f0BqMvo_',
                ).then((vak){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                });
              }

            }, child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
