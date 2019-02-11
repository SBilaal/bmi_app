import 'package:flutter/material.dart';

import './icons/bcons_icons.dart';

class BMIResultView extends StatelessWidget {
  final List<dynamic> bmiStatus;

  String result = '58.045';

  BMIResultView(this.bmiStatus);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final widgetColor = Theme.of(context);

    final closeButton = Container(
      margin: EdgeInsets.symmetric(
        horizontal: 40.0,
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
            height: deviceHeight * 0.07,
            child: Text(
              'Close',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'CircularStd-Medium',
                color: Color(0xFFAEB4C0),
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 56.0, bottom: 24.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Bcons.back_arrow,
                size: 17.0,
                color: Color(0xFF1E201D),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(
                    'Your BMI Result',
                    style: TextStyle(fontSize: 15.0, color: Color(0xFF9099AA)),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    bmiStatus[1],
                    style: TextStyle(fontSize: 25.0, color: Color(0xFF33383F)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 60.0,
                ),
                height: 187.0,
                width: 187.0,
                alignment: Alignment.center,
                child: Text(
                  bmiStatus[0],
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Color(bmiStatus[2] + 0xF0000000),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(bmiStatus[2]),
                      spreadRadius: 26.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(bottom: 30.0),
              alignment: Alignment.center, 
              child: closeButton,
              ),
          ),
        ],
      ),
    );
  }
}
