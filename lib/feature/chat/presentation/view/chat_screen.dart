import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/feature/chat/presentation/data/models/chats.dart';
import 'package:chat_app/feature/chat/presentation/data/models/message.dart';

import 'package:chat_app/feature/chat/presentation/view/widgets/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key, required String email, require, required data}) : super(key: key);
  static String id = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Chats? data;

  CollectionReference message =
      FirebaseFirestore.instance.collection('message');

  TextEditingController controller = TextEditingController();

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Messages> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(
                Messages.fromJson(snapshot.data!.docs[i]),
              );
            }
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: AppColor.kColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetData.logo, height: 50),
                    const Text('Chat'),
                  ],
                ),
              ),
              body: Column(children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return ChatBuble(message: messagesList[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      message.add({
                        'message': data,
                        'createdAt': DateTime.now(),
                        'id':email,
                      });
                      controller.clear();
                      _controller.animateTo(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                        hintText: "Send Message",
                        suffixIcon: const Icon(
                          Icons.send,
                          color: AppColor.kColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                )
              ]),
            );
          }
          return const Text('Loading...');
        });
  }
}
