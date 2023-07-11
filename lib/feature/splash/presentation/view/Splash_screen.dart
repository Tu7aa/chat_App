import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/feature/splash/presentation/view/widgets/screen_view_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.kColor,
      body: SplashScreenViewBody(),
    );
  }
}
