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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyADliIFILr3Xyg5jccDRT-9B2yDtkaQimY',
    appId: '1:534787050819:web:2150d8c703867eee81b3f6',
    messagingSenderId: '534787050819',
    projectId: 'blocgorouter',
    authDomain: 'blocgorouter.firebaseapp.com',
    storageBucket: 'blocgorouter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWQeS19hEd23sc6I_65zMfJ1oCynAY95s',
    appId: '1:534787050819:android:8518cc46310cbfdd81b3f6',
    messagingSenderId: '534787050819',
    projectId: 'blocgorouter',
    storageBucket: 'blocgorouter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZ19Qh9K4NTcKBf8dg5Tf9d0Q9SNx1vRI',
    appId: '1:534787050819:ios:0fcbdec54433b13281b3f6',
    messagingSenderId: '534787050819',
    projectId: 'blocgorouter',
    storageBucket: 'blocgorouter.appspot.com',
    iosClientId: '534787050819-sg7tcu2qstevjtuquts96plonr76plal.apps.googleusercontent.com',
    iosBundleId: 'fi.nikkijuk.blocgorouter.blocgorouter',
  );
}
