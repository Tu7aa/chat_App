import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {Key? key, required this.hintText, this.suffixIcon, this.onChanged})
      : super(key: key);
  final String hintText;
  final IconButton? suffixIcon;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (data){
          if (data!.isEmpty){
            return 'field is required';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.grey,
          filled: true,
          fillColor: const Color(0xffC4C4C4).withOpacity(.20),
        ),
      ),
    );
  }
}
