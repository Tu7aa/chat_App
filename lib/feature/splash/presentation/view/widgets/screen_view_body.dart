import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/core/utils/styles.dart';
import 'package:chat_app/feature/on_boarding/presentation/view/on_boarding_screen.dart';
import 'package:flutter/material.dart';


class SplashScreenViewBody extends StatefulWidget {
  const SplashScreenViewBody({Key? key}) : super(key: key);

  @override
  State<SplashScreenViewBody> createState() => _SplashScreenViewBodyState();
}

class _SplashScreenViewBodyState extends State<SplashScreenViewBody> {
  @override
  void initState() {
    super.initState();
    navigateHome();

  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetData.logo),
             Padding(
               padding: const EdgeInsets.only(left: 110),
               child: Row(
                 children: const [
                   Text('Explora',style: Styles.textStyle24,),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
  void navigateHome() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
            Navigator.pushNamed(context, 'onBoardingOne');
      },
    );
  }
}



