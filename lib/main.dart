import 'package:chat_app/features/login_view/views/login_view.dart';
import 'package:chat_app/features/register_view/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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



