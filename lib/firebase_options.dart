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
    apiKey: 'AIzaSyDIi4BxPc0pjdomX110KpvVFPsCacDjWy0',
    appId: '1:769996222135:web:081c6b169b0a84819ce732',
    messagingSenderId: '769996222135',
    projectId: 'task-5c42f',
    authDomain: 'task-5c42f.firebaseapp.com',
    storageBucket: 'task-5c42f.appspot.com',
    measurementId: 'G-FBXYM3VQ5W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgIPRqHUn6RRdFy3KUppK0b3fhndXKTgg',
    appId: '1:769996222135:android:b9b11460ea5f92509ce732',
    messagingSenderId: '769996222135',
    projectId: 'task-5c42f',
    storageBucket: 'task-5c42f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnK6-xzjNtO94gUq5otSv283hiR62p6uw',
    appId: '1:769996222135:ios:aff8a1d985711e549ce732',
    messagingSenderId: '769996222135',
    projectId: 'task-5c42f',
    storageBucket: 'task-5c42f.appspot.com',
    iosClientId: '769996222135-72o4bob3q8hakjcvs74adivtktb6eo5g.apps.googleusercontent.com',
    iosBundleId: 'com.example.task',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnK6-xzjNtO94gUq5otSv283hiR62p6uw',
    appId: '1:769996222135:ios:de7c43400de6fc9f9ce732',
    messagingSenderId: '769996222135',
    projectId: 'task-5c42f',
    storageBucket: 'task-5c42f.appspot.com',
    iosClientId: '769996222135-ecjp9b7sb05t3d0m6nkgp7eim203trgu.apps.googleusercontent.com',
    iosBundleId: 'com.example.task.RunnerTests',
  );
}
