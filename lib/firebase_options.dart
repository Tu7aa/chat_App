// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCyWD-FdHhFXm-6uVQtV3j96uAeTFTLTpU',
    appId: '1:249390068287:web:096d703ff12c2be6147e8a',
    messagingSenderId: '249390068287',
    projectId: 'chat-app-e2f8a',
    authDomain: 'chat-app-e2f8a.firebaseapp.com',
    databaseURL: 'https://chat-app-e2f8a-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-e2f8a.appspot.com',
    measurementId: 'G-5MVJ84X18E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAQsU6Rbe2X3WJQ5JeN7iDpUI3TpADoG4',
    appId: '1:249390068287:android:3b7bb94746a5c6a8147e8a',
    messagingSenderId: '249390068287',
    projectId: 'chat-app-e2f8a',
    databaseURL: 'https://chat-app-e2f8a-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-e2f8a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDX9c-d4MmplZ3BUxUalWGo01F3dgDeOUY',
    appId: '1:249390068287:ios:a8dea2592f998c22147e8a',
    messagingSenderId: '249390068287',
    projectId: 'chat-app-e2f8a',
    databaseURL: 'https://chat-app-e2f8a-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-e2f8a.appspot.com',
    iosClientId: '249390068287-roq9lma8p035jrhhtu8bdlp8g0hansrn.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDX9c-d4MmplZ3BUxUalWGo01F3dgDeOUY',
    appId: '1:249390068287:ios:a8dea2592f998c22147e8a',
    messagingSenderId: '249390068287',
    projectId: 'chat-app-e2f8a',
    databaseURL: 'https://chat-app-e2f8a-default-rtdb.firebaseio.com',
    storageBucket: 'chat-app-e2f8a.appspot.com',
    iosClientId: '249390068287-roq9lma8p035jrhhtu8bdlp8g0hansrn.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
