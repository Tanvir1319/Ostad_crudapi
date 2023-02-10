import 'package:api/Screen/ProductShowScreen.dart';
import 'package:api/onboarding/splashScreen.dart';
import 'package:flutter/material.dart';

import 'Screen/ProductCreateScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: MySplashScreen(),
    );
  }
}