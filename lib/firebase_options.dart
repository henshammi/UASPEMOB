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
    apiKey: 'AIzaSyDJw6i1dRorapEKzflgNi9KUc2U1eDzp-c',
    appId: '1:607636448971:web:11b196f1d6e719a6ec9d4e',
    messagingSenderId: '607636448971',
    projectId: 'tubespemob-88a5a',
    authDomain: 'tubespemob-88a5a.firebaseapp.com',
    storageBucket: 'tubespemob-88a5a.appspot.com',
    measurementId: 'G-W8N7PX99D0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8hrMZqd1EwQmK30O_E0yX-B7D2Nn3nwI',
    appId: '1:607636448971:android:9f5d138fe0430b26ec9d4e',
    messagingSenderId: '607636448971',
    projectId: 'tubespemob-88a5a',
    storageBucket: 'tubespemob-88a5a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCH0E1kFOcHZvgBoxGSyzFtMu64W5Ucmp8',
    appId: '1:607636448971:ios:a3651128871dc186ec9d4e',
    messagingSenderId: '607636448971',
    projectId: 'tubespemob-88a5a',
    storageBucket: 'tubespemob-88a5a.appspot.com',
    iosBundleId: 'com.example.aplikasipemob',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCH0E1kFOcHZvgBoxGSyzFtMu64W5Ucmp8',
    appId: '1:607636448971:ios:258bb599a96f4025ec9d4e',
    messagingSenderId: '607636448971',
    projectId: 'tubespemob-88a5a',
    storageBucket: 'tubespemob-88a5a.appspot.com',
    iosBundleId: 'com.example.aplikasipemob.RunnerTests',
  );
}
