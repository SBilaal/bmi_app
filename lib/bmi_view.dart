import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/bmi_form.dart';
import 'views/bmi_appbar.dart';

class BMICalculatorView extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    final textFieldCommand = Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
      child: Text(
        'Calculate your BMI by inputting the following data.',
        style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
          color: Color(0xFF33383F),
        ),
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: BMIAppbar(),
          ),
          textFieldCommand,
          SizedBox(
            height: 79.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
            child: BMIInputForm(),
          ),
        ],
      ),
    );
  }
}
