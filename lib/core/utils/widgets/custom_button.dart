import 'package:flutter/material.dart';

import '../colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key, this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 350, top: 100),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.kButtonColor),
      child: IconButton(
        onPressed:onPressed,
        icon: const Icon(Icons.arrow_forward_ios, color: Color(0xffFFFFFF)),
      ),
    );
  }
}
