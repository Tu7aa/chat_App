import 'package:chat_app/core/utils/styles.dart';
import 'package:chat_app/feature/chat/presentation/data/models/chats.dart';
import 'package:flutter/material.dart';

class ChatsCard extends StatelessWidget {
  const ChatsCard({super.key, required this.chats, required this.press});

  final VoidCallback press;
  final Chats chats;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(chats.image),
                  ),
                  if (chats.isActive)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 15,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(color: Colors.white, width: 3)),
                      ),
                    )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chats.name,
                    style:Styles.textStyle20,
                  ),
                  Text(
                    chats.lastMessage,
                    style: Styles.textStyle16),

                ],
              ),
              const Spacer(),
              Text(
                chats.time,
                style: Styles.textStyle14
              )
            ],
          )),
    );
  }
}