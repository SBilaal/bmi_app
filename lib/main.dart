import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import 'bmi_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'CircularStd-Medium',
        primaryColor: Color(0xFF0DEEDB),
      ),
      home: BMICalculatorView(),
    );
  }
}

// class BMISplashScreen extends StatefulWidget {
//   @override
//   _BMISplashScreenState createState() => _BMISplashScreenState();
// }

// class _BMISplashScreenState extends State<BMISplashScreen> {

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(
//       builder: (context) => BMICalculatorView(),
//     )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: FlutterLogo(),
//       ),
//     );
//   }
// }
