import 'package:chat_app/features/login_view/views/login_view.dart';
import 'package:chat_app/features/register_view/views/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.id : (context)=>LoginView(),
        RegisterView.id :(context)=>RegisterView()
      },
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}



