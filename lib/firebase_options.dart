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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDq0RSUK9QZsDsMkPon514K6lsCUHp8uKs',
    appId: '1:991036458852:android:6899f659fc3fbdef4d1c71',
    messagingSenderId: '991036458852',
    projectId: 'my-find-job-apps',
    storageBucket: 'my-find-job-apps.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPu0xfg4HlO2_aoL1WlO2hCzYB5bfk9k0',
    appId: '1:991036458852:ios:5fb77a2eccb6c5f24d1c71',
    messagingSenderId: '991036458852',
    projectId: 'my-find-job-apps',
    storageBucket: 'my-find-job-apps.firebasestorage.app',
    iosBundleId: 'com.example.practiceJobAppFl',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPu0xfg4HlO2_aoL1WlO2hCzYB5bfk9k0',
    appId: '1:991036458852:ios:5fb77a2eccb6c5f24d1c71',
    messagingSenderId: '991036458852',
    projectId: 'my-find-job-apps',
    storageBucket: 'my-find-job-apps.firebasestorage.app',
    iosBundleId: 'com.example.practiceJobAppFl',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBVE_DwD9EJoJRf2wzJsMF4Qa_AjDo3_fU',
    appId: '1:991036458852:web:cf3947fa618e594f4d1c71',
    messagingSenderId: '991036458852',
    projectId: 'my-find-job-apps',
    authDomain: 'my-find-job-apps.firebaseapp.com',
    storageBucket: 'my-find-job-apps.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBVE_DwD9EJoJRf2wzJsMF4Qa_AjDo3_fU',
    appId: '1:991036458852:web:39abaf15ac40e3984d1c71',
    messagingSenderId: '991036458852',
    projectId: 'my-find-job-apps',
    authDomain: 'my-find-job-apps.firebaseapp.com',
    storageBucket: 'my-find-job-apps.firebasestorage.app',
  );

}