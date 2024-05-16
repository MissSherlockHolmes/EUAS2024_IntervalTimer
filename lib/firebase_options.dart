import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // if (kIsWeb) {
    //   // You need to fill this in if you have a web app
    //   return const FirebaseOptions(
    //     apiKey: 'Your_Web_ApiKey',
    //     appId: 'Your_Web_AppId',
    //     messagingSenderId: 'Your_Web_SenderId',
    //     projectId: 'interval-timer-45732',
    //     authDomain: 'Your_Web_AuthDomain',
    //     storageBucket: 'interval-timer-45732.appspot.com',
    //     measurementId: 'Your_Web_MeasurementId',
    //   );
    // }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return const FirebaseOptions(
          apiKey: "AIzaSyAi_E83mFncGpdo1MZCDLJuhdHEeUX5Tts", // API key for Android
          appId: "1:228403487278:android:ca3ced18701091d30075bf", // App ID for Android
          messagingSenderId: "228403487278", // Sender ID
          projectId: "interval-timer-45732", // Project ID
          storageBucket: "interval-timer-45732.appspot.com", // Storage bucket
        );
      case TargetPlatform.iOS:
        return const FirebaseOptions(
          apiKey: "AlzaSyCexLWnFWsW5REbsYavrOiKhKR7iYCZCp4", // API key for iOS
          appId: "1:228403487278:ios:fb30aa41b9691a150075bf", // App ID for iOS
          messagingSenderId: "228403487278", // Sender ID
          projectId: "interval-timer-45732", // Project ID
          storageBucket: "interval-timer-45732.appspot.com", // Storage bucket
        );
      default:
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  // Private constructor to prevent instantiation.
  DefaultFirebaseOptions._();
}
