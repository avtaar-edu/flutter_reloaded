// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyB_qI-3KruLHs20Nr4lNHkglcu0tPQpDEo',
    appId: '1:584022552068:web:d31483d052b81077ad0f51',
    messagingSenderId: '584022552068',
    projectId: 'phone-firebase-1017c',
    authDomain: 'phone-firebase-1017c.firebaseapp.com',
    storageBucket: 'phone-firebase-1017c.appspot.com',
    measurementId: 'G-NF3CN5M876',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRa0eHFeOrPgwi3VtcSXvtYPLN4CAX0Ic',
    appId: '1:584022552068:android:bb7d1374a84ee97cad0f51',
    messagingSenderId: '584022552068',
    projectId: 'phone-firebase-1017c',
    storageBucket: 'phone-firebase-1017c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCI-vLOZRlcUEUskGXzbe3J_OmAoP_XWSw',
    appId: '1:584022552068:ios:16614da13f089c40ad0f51',
    messagingSenderId: '584022552068',
    projectId: 'phone-firebase-1017c',
    storageBucket: 'phone-firebase-1017c.appspot.com',
    iosBundleId: 'com.example.avtaarSignupotp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCI-vLOZRlcUEUskGXzbe3J_OmAoP_XWSw',
    appId: '1:584022552068:ios:16614da13f089c40ad0f51',
    messagingSenderId: '584022552068',
    projectId: 'phone-firebase-1017c',
    storageBucket: 'phone-firebase-1017c.appspot.com',
    iosBundleId: 'com.example.avtaarSignupotp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB_qI-3KruLHs20Nr4lNHkglcu0tPQpDEo',
    appId: '1:584022552068:web:c117c56955de264dad0f51',
    messagingSenderId: '584022552068',
    projectId: 'phone-firebase-1017c',
    authDomain: 'phone-firebase-1017c.firebaseapp.com',
    storageBucket: 'phone-firebase-1017c.appspot.com',
    measurementId: 'G-F7TR6HFD26',
  );

}