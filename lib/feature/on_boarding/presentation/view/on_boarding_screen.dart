import 'package:chat_app/feature/on_boarding/presentation/view/widgets/on_bording_screen_body.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: OnBoradingScreenBody(),
    );
  }
}
