import 'package:chat_app/core/utils/app_assets.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/features/chat_view/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String id = "ChatView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.kLogo, width: 44),
            Text(
              "Chat",
              style: TextStyle(fontSize: 20, color: AppColors.kRowTextColor),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 12,
                itemBuilder:(context,index){
              return Align(alignment:Alignment.centerLeft,
              child: ChatBubble());
            }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Send message",
                suffixIcon: Icon(Icons.send,color: AppColors.kPrimaryColor,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.kPrimaryColor
                  ),
                  borderRadius: BorderRadius.circular(12)
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
