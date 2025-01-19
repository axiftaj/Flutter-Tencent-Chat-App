import 'package:flutter/material.dart';
import 'package:tencent_chat_sdk_tutorial/controller.dart';
import 'package:tencent_chat_sdk_tutorial/login_screen.dart';

import 'home_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // Access the singleton
  final timService = TIMUIKitService();

  // Initialize the SDK
  timService.initTIMUIKIT();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
