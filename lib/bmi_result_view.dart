import 'package:flutter/material.dart';

import './icons/bcons_icons.dart';

class BMIResultView extends StatelessWidget {
  final List<dynamic> bmiStatus;

  String result = '58.045';

  BMIResultView(this.bmiStatus);

  @override
  Widget build(BuildContext context) {
    final widgetColor = Theme.of(context);

    final closeButton = Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: widgetColor.primaryColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Color(0x0D538CFF),
        color: Colors.white,
        elevation: 3.0,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(10.0),
          splashColor: widgetColor.primaryColor,
          highlightColor: widgetColor.primaryColor,
          child: Container(
            alignment: Alignment.center,
            height: 49.0,
            child: Text(
              'Close',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'CircularStd-Medium',
                color: Color(0xFFAEB4C0),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(24.0, 56.67, 0.0, 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Bcons.back_arrow,
                size: 14.0,
                color: Color(0xFF1E201D),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  'Your BMI Result',
                  style: TextStyle(fontSize: 12.0, color: Color(0xFF9099AA), fontFamily: 'CircularStd-Book'),
                ),
                SizedBox(
                  height: 3.0,
                ),
                Text(
                  bmiStatus[1],
                  style: TextStyle(fontSize: 20.0, color: Color(0xFF33383F)),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.fromLTRB(60.0, 120.0, 60.0, 103.0),
              height: 170.0,
              width: 170.0,
              alignment: Alignment.center,
              child: Text(
                bmiStatus[0],
                style: TextStyle(
                  fontSize: 38.0,
                  color: Color(bmiStatus[2] + 0xF0000000),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(bmiStatus[2]),
                    spreadRadius: 20.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30.0),
            alignment: Alignment.center,
            child: closeButton,
          ),
        ],
      ),
    );
  }
}
