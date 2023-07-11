import 'package:chat_app/core/utils/assets.dart';
import 'package:chat_app/core/utils/colors.dart';
import 'package:chat_app/core/utils/styles.dart';
import 'package:chat_app/core/utils/widgets/show_snak_bar.dart';
import 'package:chat_app/feature/chat/presentation/view/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../core/utils/widgets/custom_text_form.dart';


class LoginPageBody extends StatefulWidget {
  const LoginPageBody({Key? key}) : super(key: key);
  static String id = 'LoginPage';

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  bool isObscureText = true;
  bool isLoading = false;
  GlobalKey<FormState> key = GlobalKey();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Form(
        key: key,
        child: ListView(
          children: [
            Column(
              children: [
                buildStack(),
                SizedBox(height: MediaQuery.of(context).size.height * .027),
                CustomTextForm(
                  onChanged: (data){
                    email =data;
                  },
                  hintText: 'Enter your Email',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.email_outlined),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .03),
                CustomTextForm(
                  onChanged: (data){
                    password =data;
                  },
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    icon: isObscureText
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
                buildPadding(),
                SizedBox(height: MediaQuery.of(context).size.height * .20),
                CustomMaterialButton(
                  text: 'Next',
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        Navigator.pushNamed(context, ChatScreen.id,arguments:email);
                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                        if (e.code == 'email-already-in-use') {
                          showSnackBar(
                              context, "already user found for that email.");
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }if (e.code == 'user-not-found') {
                          showSnackBar(context,
                              'No user found for that email.');
                        }
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                buildRow()
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Forget password?",
                style: Styles.textStyle18.copyWith(color: AppColor.kColor),
              ))
        ],
      ),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'New Member?',
          style: Styles.textStyle18.copyWith(color: AppColor.kButtonColor),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'RegisterPage');
            },
            child: Text(
              'Register now',
              style: Styles.textStyle18.copyWith(
                  color: AppColor.kColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

  Stack buildStack() {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 70, top: 20),
        child: Image.asset(AssetData.loginPhoto),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50, top: 155),
        child: Column(
          children: [
            Text(
              'Welcome back',
              style: Styles.textStyle24.copyWith(color: AppColor.kButtonColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'sign in to access your account',
              style: Styles.textStyle20,
            )
          ],
        ),
      )
    ]);
  }
}
