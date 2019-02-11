import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
