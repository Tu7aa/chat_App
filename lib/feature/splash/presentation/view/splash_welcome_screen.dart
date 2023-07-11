import 'package:chat_app/feature/splash/presentation/view/widgets/splash_welcome_screen_body.dart';
import 'package:flutter/material.dart';
class SplashWelcomeScreen extends StatelessWidget {
  const SplashWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashWelcomeScreenBody(),
    );
  }
}
