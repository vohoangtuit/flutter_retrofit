import 'package:flutter/material.dart';
import 'package:retrofit_app/screens/splash.dart';

// todo: tham khảo chopper : https://github.com/ResoCoder/flutter-chopper-tutorial-course
// todo: https://medium.com/globant-mobile-studio-india/easy-way-to-implement-rest-api-calls-in-flutter-9859d1ab5396
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Retrofit Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

