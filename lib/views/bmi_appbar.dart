import 'package:flutter/material.dart';

class BMIAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final widgetColor = Theme.of(context);

    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 60.0, deviceWidth * 0.58, 0.0),
      width: deviceWidth * 0.42,
      height: deviceHeight * 0.048,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
              color: Color(0x0D538CFF),
              blurRadius: 10.0,
              offset: Offset(0.0, 3.0))
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: deviceWidth * 0.06,
            height: deviceHeight * 0.048,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
              color: widgetColor.primaryColor,
            ),
            child: Text(
              'B',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'CircularStd-Book',
                color: widgetColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
