import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/feature/list_of_chats/presentation/view/widgets/button.dart';
import 'package:chat_app/feature/list_of_chats/presentation/view/widgets/list_of_widgets.dart';
import 'package:flutter/material.dart';


class ChatsBody extends StatefulWidget {
  const ChatsBody({super.key, required this.email});
  final email;

  @override
  State<ChatsBody> createState() => _ChatsBodyState();
}

class _ChatsBodyState extends State<ChatsBody> {
  bool onpressOne = true;
  bool onPressTwo = false;

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 50, 20, 20),
              color: AppColor.kColor,
              child: Row(
                children: [
                  FieldOutlineButton(
                    press: () {
                      if (onPressTwo == false) {
                        setState(() {
                          onpressOne = !onpressOne;
                        });
                      }
                    },
                    text: "Recent Message",
                    isFaild: onpressOne,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FieldOutlineButton(
                    press: () {
                      if (onpressOne == false) {
                        setState(() {
                          onPressTwo = !onPressTwo;
                        });
                      }
                    },
                    text: "Active",
                    isFaild: onPressTwo,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListWidget(
                email: widget.email,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
