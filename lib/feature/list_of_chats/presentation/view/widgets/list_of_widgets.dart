import 'package:chat_app/feature/chat/presentation/data/models/chats.dart';
import 'package:chat_app/feature/chat/presentation/view/chat_screen.dart';
import 'package:chat_app/feature/list_of_chats/presentation/view/widgets/chat_card.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: listOfChats.length,
            itemBuilder: (context, index) => ChatsCard(
              chats: listOfChats[index],
              press: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext bc) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Container(
                        height: 800,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(4),
                          ),
                        ),
                        child: ChatScreen(
                          email: email,
                          data: listOfChats[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
