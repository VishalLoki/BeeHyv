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
    apiKey: 'AIzaSyArW_QxqrgUpnqi5mchNzQ1qjWPM6JJWLQ',
    appId: '1:686093658158:web:8469c05930fba8211657bf',
    messagingSenderId: '686093658158',
    projectId: 'beehyv-9484b',
    authDomain: 'beehyv-9484b.firebaseapp.com',
    storageBucket: 'beehyv-9484b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbGpG7_e8AoROG4vce42Dwhj-tz3pvt8o',
    appId: '1:686093658158:android:8233ad17cd4147391657bf',
    messagingSenderId: '686093658158',
    projectId: 'beehyv-9484b',
    storageBucket: 'beehyv-9484b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCb_54SCWR3uXNvn0fA4zv_Wgd4u-7ZS9s',
    appId: '1:686093658158:ios:29682beb0acbbb481657bf',
    messagingSenderId: '686093658158',
    projectId: 'beehyv-9484b',
    storageBucket: 'beehyv-9484b.appspot.com',
    iosBundleId: 'com.vishy.beehyv',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCb_54SCWR3uXNvn0fA4zv_Wgd4u-7ZS9s',
    appId: '1:686093658158:ios:29682beb0acbbb481657bf',
    messagingSenderId: '686093658158',
    projectId: 'beehyv-9484b',
    storageBucket: 'beehyv-9484b.appspot.com',
    iosBundleId: 'com.vishy.beehyv',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyArW_QxqrgUpnqi5mchNzQ1qjWPM6JJWLQ',
    appId: '1:686093658158:web:a62ff5c8dbfad97d1657bf',
    messagingSenderId: '686093658158',
    projectId: 'beehyv-9484b',
    authDomain: 'beehyv-9484b.firebaseapp.com',
    storageBucket: 'beehyv-9484b.appspot.com',
  );
}
