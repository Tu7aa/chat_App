import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/core/utils/styles.dart';
import 'package:chat_app/feature/auth/presentation/view/login_page.dart';
import 'package:chat_app/feature/on_boarding/presentation/view/widgets/on_boarding_two.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/custom_button.dart';


class OnBoradingTwo extends StatelessWidget {
  const OnBoradingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 210),
            child: Image.asset(AssetData.onBoardPhotoTwo),
          ),
          const SizedBox(
            height: 30,
          ),
          buildPadding(),
          CustomButton(onPressed: ()  {
            Navigator.pushNamed(context, 'LogScreen');
          })
        ],
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.only(right: 133),
      child: Column(
        children: [
          Text(
            'Reach the ',
            style: Styles.textStyle24.copyWith(
                color: const Color(0xff252525), fontWeight: FontWeight.bold),
          ),
          Text(
            'unknown spot',
            style: Styles.textStyle24.copyWith(
                color: AppColor.kButtonColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'To your destination',
            style: Styles.textStyle20.copyWith(
              color: AppColor.kButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}
