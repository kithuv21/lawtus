import 'package:flutter/material.dart';
import 'package:lawtus/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  try
{  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
}catch(e){
  print(e);
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