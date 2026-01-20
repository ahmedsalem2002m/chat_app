import 'package:chat_app/features/chat_view/data/models/message_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ChatBubble extends StatelessWidget {
   final MessageModel  message;
   ChatBubble({super.key, required this.message});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
        minWidth: MediaQuery.of(context).size.width * 0.2
      ),
      // height: 65,
      // width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: AppColors.kPrimaryColor,
      ),
      child: Text(
        message.message,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}




class ChatBubbleForFriend extends StatelessWidget {
   final MessageModel  message;
   const ChatBubbleForFriend({super.key, required this.message});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
        minWidth: MediaQuery.of(context).size.width * 0.2
      ),
      // height: 65,
      // width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColors.kChatForFriendColor,
      ),
      child: Text(
        message.message,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
