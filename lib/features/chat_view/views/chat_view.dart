import 'package:chat_app/core/utils/app_assets.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/app_constants.dart';
import 'package:chat_app/features/chat_view/data/models/message_model.dart';
import 'package:chat_app/features/chat_view/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});
  static String id = "ChatView";

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final CollectionReference messages = FirebaseFirestore.instance.collection(
    AppConstants.kMessageCollection,
  );

  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  var email;


  @override
  Widget build(BuildContext context) {
     email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.kLogo, width: 44),
            const SizedBox(width: 8),
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
            child: StreamBuilder<QuerySnapshot>(
              stream: messages
                  .orderBy(AppConstants.kCreatesAt,descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  reverse: true,
                  controller: _scrollController,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final message = MessageModel.fromJson(
                      snapshot.data!.docs[index],
                    );
                    return Align(
                      alignment:message.id == email ? Alignment.centerLeft:Alignment.centerRight,
                      child:message.id == email ? ChatBubble(message: message):ChatBubbleForFriend(message: message),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Send message",
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: AppColors.kPrimaryColor),
                  onPressed: sendMessage,
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

  void sendMessage() {
    final text = messageController.text.trim();

    if (text.isEmpty) return;

    messages.add({
      AppConstants.kMessage: text,
      AppConstants.kCreatesAt: FieldValue.serverTimestamp(),
      "id" : email
    });

    messageController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }
}
