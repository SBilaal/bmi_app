import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'bmi_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
    ));
    final Color primaryColor = Color(0xFF0DEEDB);
    return MaterialApp(
      title: 'BMI App',
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionHandleColor: primaryColor,
        fontFamily: 'CircularStd-Medium',
        primaryColor: primaryColor,
        cursorColor: primaryColor,
      ),
      home: BMICalculatorView(),
    );
  }
}
