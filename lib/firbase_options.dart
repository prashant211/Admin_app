import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

FirebaseOptions firebaseOptions = Platform.isAndroid ? const FirebaseOptions(
    apiKey: 'AIzaSyBYsYxmcYNalvwkcsvNWFd-jUBVR1I643Y',
    appId: '1:101974208074:android:542f6aab32e39b645cc0b3',
    messagingSenderId: '101974208074',
    projectId: 'flutter-prep-91856'
) :  const FirebaseOptions(apiKey: 'AIzaSyDQh8tPZ0qosa-KEuQ7KiD_D3Y-667TBG0',
    appId: '1:101974208074:ios:7e99e0019935e6155cc0b3',
    messagingSenderId: '101974208074',
    projectId: 'flutter-prep-91856');