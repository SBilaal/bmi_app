import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/bmi_form.dart';
import 'views/bmi_appbar.dart';

class BMICalculatorView extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    final textFieldCommand = Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 0.0),
      child: Text(
        'Calculate your BMI by inputting the following data.',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w600,
          color: Color(0xFF33383F),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          BMIAppbar(),
          textFieldCommand,
          SizedBox(
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BMIInputForm(),
          ),
        ],
      ),
    );
  }
}





