// // File generated by FlutterFire CLI.
// // ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;

// /// Default [FirebaseOptions] for use with your Firebase apps.
// ///
// /// Example:
// /// ```dart
// /// import 'firebase_options.dart';
// /// // ...
// /// await Firebase.initializeApp(
// ///   options: DefaultFirebaseOptions.currentPlatform,
// /// );
// /// ```
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

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
        return windows;
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
    apiKey: 'AIzaSyC3JN1ybwaVZZrr4v0VKPyRpfBeVgGoGDU',
    appId: '1:165258134187:web:d88b15bf8576aed2f22dee',
    messagingSenderId: '165258134187',
    projectId: 'agendlab2',
    authDomain: 'agendlab2.firebaseapp.com',
    storageBucket: 'agendlab2.appspot.com',
    measurementId: 'G-8ETVMER1F5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKGNTQu8hzzlVXXaU_egEh7FJQuyuJ8SA',
    appId: '1:165258134187:android:c3aca6f4f71a6335f22dee',
    messagingSenderId: '165258134187',
    projectId: 'agendlab2',
    storageBucket: 'agendlab2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMkxDmGmTNJKi6rqSnxC_xeXGz2Z6OTEE',
    appId: '1:165258134187:ios:635907dbfbd5c915f22dee',
    messagingSenderId: '165258134187',
    projectId: 'agendlab2',
    storageBucket: 'agendlab2.appspot.com',
    iosBundleId: 'com.example.agendlab2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMkxDmGmTNJKi6rqSnxC_xeXGz2Z6OTEE',
    appId: '1:165258134187:ios:635907dbfbd5c915f22dee',
    messagingSenderId: '165258134187',
    projectId: 'agendlab2',
    storageBucket: 'agendlab2.appspot.com',
    iosBundleId: 'com.example.agendlab2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3JN1ybwaVZZrr4v0VKPyRpfBeVgGoGDU',
    appId: '1:165258134187:web:4d9276ad01b3cb1cf22dee',
    messagingSenderId: '165258134187',
    projectId: 'agendlab2',
    authDomain: 'agendlab2.firebaseapp.com',
    storageBucket: 'agendlab2.appspot.com',
    measurementId: 'G-S264FTC16W',
  );

}