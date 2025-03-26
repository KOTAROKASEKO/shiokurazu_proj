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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmcPiM9Nl51Y89b-_soh9w_B7pezH4g5w',
    appId: '1:760242476548:android:df9dfc4f456e6af7f8c751',
    messagingSenderId: '760242476548',
    projectId: 'assignment-64e6a',
    storageBucket: 'assignment-64e6a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNNx7b4248jQhYliSv8CHDSGu4O7E-uK4',
    appId: '1:760242476548:ios:77c976f78db6cd47f8c751',
    messagingSenderId: '760242476548',
    projectId: 'assignment-64e6a',
    storageBucket: 'assignment-64e6a.firebasestorage.app',
    androidClientId: '760242476548-3rcmgbkco0meil47hgaj27ve0th5tkko.apps.googleusercontent.com',
    iosClientId: '760242476548-38vgpoqj1p36eslskc7rbulnttqa08kq.apps.googleusercontent.com',
    iosBundleId: 'com.example.moneymanager',
  );

}