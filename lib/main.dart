import 'package:chat_app/feature/auth/presentation/view/login_page.dart';
import 'package:chat_app/feature/auth/presentation/view/register_page.dart';
import 'package:chat_app/feature/chat/presentation/view/chat_screen.dart';
import 'package:chat_app/feature/list_of_chats/presentation/view/widgets/chats_body.dart';
import 'package:chat_app/feature/on_boarding/presentation/view/widgets/on_boarding_two.dart';
import 'package:chat_app/feature/on_boarding/presentation/view/widgets/on_bording_screen_body.dart';
import 'package:chat_app/feature/splash/presentation/view/splash_welcome_screen.dart';
import 'package:chat_app/feature/splash/presentation/view/widgets/splash_welcome_screen_body.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'feature/splash/presentation/view/Splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "SplashScreen": (context) =>  SplashScreen(),
        "onBoardingOne": (context) =>  OnBoradingScreenBody(),
        "onBoardingTwo": (context) =>  OnBoradingTwo(),
        "RegisterPage": (context) => RegisterPage(),
        "ChatScreen": (context) => ChatScreen(email: '', data: '',),
        "LogScreen": (context) => LoginPage(),
        "chats":(context)=>ChatsBody(email: ""),
        "welcomeScreen":(context)=>SplashWelcomeScreen()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcomeScreen',
    );
  }
}
