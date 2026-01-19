import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String id = "ChatView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome",style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.w900,
          color: AppColors.kPrimaryColor
        ),),
      ),
    );
  }
}
