import 'package:chat_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashWelcomeScreenBody extends StatelessWidget {
  const SplashWelcomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text('Welcome To Home'),
          Center(child: Image.asset(AssetData.welcomePic)),
        ],
      ),
    );
  }
}
