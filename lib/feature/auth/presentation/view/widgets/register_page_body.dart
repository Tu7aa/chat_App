
import 'package:chat_app/core/utils/widgets/show_snak_bar.dart';
import 'package:chat_app/feature/chat/presentation/view/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_material_button.dart';
import '../../../../../core/utils/widgets/custom_text_form.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({Key? key}) : super(key: key);
  static String id = 'RegisterPage';
  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  bool isObscureText = true;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: ListView(
        children: [
          SafeArea(
            child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  children: [
                    buildStack(),
                    SizedBox(height: MediaQuery.of(context).size.height * .027),
                    CustomTextForm(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Enter your Email',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .03),
                    SizedBox(height: MediaQuery.of(context).size.height * .01),
                    CustomTextForm(
                      onChanged: (data) {
                        password = data;
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
                    SizedBox(height: MediaQuery.of(context).size.height * .10),
                    CustomMaterialButton(
                        text: 'Next',
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {

                            });
                            try {
                              await registerUser();
                             Navigator.pushNamed(context,ChatScreen.id,arguments: email);
                            } on FirebaseAuthException catch (e) {
                               print(e.code);
                              if (e.code == 'email-already-in-use') {
                                showSnackBar(
                                    context, "already user found for that email.");
                              } else if (e.code == 'wrong-password') {
                                showSnackBar(context,
                                    'Wrong password provided for that user.');
                              }
                            }

                            isLoading = false;
                            setState(() {

                            });
                          }


                        }),
                    buildRow()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }



  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
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
          'Already a Member?',
          style: Styles.textStyle18.copyWith(color: AppColor.kButtonColor),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Log in',
              style: Styles.textStyle18.copyWith(
                  color: AppColor.kColor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  Stack buildStack() {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 75, top: 20),
        child: Image.asset(AssetData.loginPhoto),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 55, top: 155),
        child: Column(
          children: [
            Text(
              'Get Started',
              style: Styles.textStyle24.copyWith(color: AppColor.kButtonColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'by creating a free account.',
              style: Styles.textStyle20,
            )
          ],
        ),
      )
    ]);
  }
}
