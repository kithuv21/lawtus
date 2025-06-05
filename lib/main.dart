import 'package:flutter/material.dart';
import 'package:lawtus/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  try
{  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
   await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug
   );
   print('App is checked');
}catch(e){
  print('pleaseeee$e');
}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Samsung'
      ),
      home: Homepage(),
    );
  }
}