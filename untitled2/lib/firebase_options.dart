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
    apiKey: 'AIzaSyDxVSPX_GSV9EbVgkx1a-C02pn50y_mKA8',
    appId: '1:737105987369:web:6dd94387f5002227301938',
    messagingSenderId: '737105987369',
    projectId: 'untitled2-48e5f',
    authDomain: 'untitled2-48e5f.firebaseapp.com',
    storageBucket: 'untitled2-48e5f.appspot.com',
    measurementId: 'G-8WYDVFKE16',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIhy80SYS8t6bGLaH6X3WkiWTK9VHCClc',
    appId: '1:737105987369:android:9f69fc491d2d3ac3301938',
    messagingSenderId: '737105987369',
    projectId: 'untitled2-48e5f',
    storageBucket: 'untitled2-48e5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMf-7JH2AjDoS7Ggai_VKXnJA9Q00dKxY',
    appId: '1:737105987369:ios:5bbd21673569f3dd301938',
    messagingSenderId: '737105987369',
    projectId: 'untitled2-48e5f',
    storageBucket: 'untitled2-48e5f.appspot.com',
    iosClientId: '737105987369-5vo5k0v5v7vvv46hds9m8d0m3ar581l3.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMf-7JH2AjDoS7Ggai_VKXnJA9Q00dKxY',
    appId: '1:737105987369:ios:aa211fd9f8cf83c1301938',
    messagingSenderId: '737105987369',
    projectId: 'untitled2-48e5f',
    storageBucket: 'untitled2-48e5f.appspot.com',
    iosClientId: '737105987369-5daousa0ljdj0m4logpcp4irjdsj5ksn.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled2.RunnerTests',
  );
}