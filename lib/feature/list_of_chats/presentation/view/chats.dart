import 'package:chat_app/feature/list_of_chats/presentation/view/widgets/chats_body.dart';
import 'package:flutter/material.dart';
class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ChatsBody(email: "",)),
    );
  }
}
