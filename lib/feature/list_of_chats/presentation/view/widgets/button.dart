import 'package:flutter/material.dart';

class FieldOutlineButton extends StatelessWidget {
  const FieldOutlineButton(
      {Key? key, this.isFaild = true, required this.text, required this.press})
      : super(key: key);

  final bool isFaild;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Colors.white, width: 1),
      ),
      onPressed: press,
      elevation: isFaild ? 5 : 0,
      color: isFaild ? Colors.white : Colors.transparent,
      child: Text(
        text,
        style: TextStyle(
            color: isFaild ? Colors.blue : Colors.white, fontSize: 12),
      ),
    );
  }
}