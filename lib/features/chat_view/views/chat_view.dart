import 'package:chat_app/core/utils/app_assets.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/app_constants.dart';
import 'package:chat_app/features/chat_view/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = "ChatView";
  CollectionReference messages = FirebaseFirestore.instance.collection(
    AppConstants.kMessageCollection,
  );
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // if (!snapshot.hasData) {
          //   return Scaffold(
          //     appBar: AppBar(
          //       backgroundColor: AppColors.kPrimaryColor,
          //       centerTitle: true,
          //       title: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Image.asset(AppAssets.kLogo, width: 44),
          //           Text(
          //             "Chat",
          //             style: TextStyle(fontSize: 20, color: AppColors.kRowTextColor),
          //           ),
          //         ],
          //       ),
          //     ),
          //     body: Column(
          //       children: [
          //         Expanded(
          //           child: ListView.builder(
          //             itemCount: 12,
          //             itemBuilder: (context, index) {
          //               return Align(
          //                 alignment: Alignment.centerLeft,
          //                 child: ChatBubble(),
          //               );
          //             },
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(12.0),
          //           child: TextField(
          //             controller: messageController,
          //             decoration: InputDecoration(
          //               hintText: "Send message",
          //               suffixIcon: IconButton(
          //                 icon: Icon(Icons.send, color: AppColors.kPrimaryColor),
          //                 onPressed: () {
          //                   final text = messageController.text.trim();
          //                   if (text.isNotEmpty) {
          //                     messages.add({"message": text});
          //                     messageController.clear();
          //                   }
          //                 },
          //               ),
          //               border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(12),
          //               ),
          //               enabledBorder: OutlineInputBorder(
          //                 borderSide: BorderSide(color: AppColors.kPrimaryColor),
          //                 borderRadius: BorderRadius.circular(12),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   );
          // }

          final doc = snapshot.data!.docs[0];
          final messageData = doc.data() as Map<String, dynamic>;
          print(messageData["message"]);

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

                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final doc = snapshot.data!.docs[index];
                      final messageData = doc.data() as Map<String, dynamic>;
                      print(messageData["message"]);
                      return Align(
                        alignment: Alignment.bottomLeft,
                        child: ChatBubble(message:messageData["message"]),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Send message",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send, color: AppColors.kPrimaryColor),
                        onPressed: () {
                          final text = messageController.text.trim();
                          if (text.isNotEmpty) {
                            messages.add({"message": text});
                            messageController.clear();
                          }
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kPrimaryColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

    );
  }
}
