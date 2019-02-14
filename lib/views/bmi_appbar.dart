import 'package:flutter/material.dart';

class BMIAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widgetColor = Theme.of(context);

    return Container(
      child: Container(
        margin: EdgeInsets.fromLTRB(20.0, 60.0, 0.0, 0.0),
        width: 148.0,
        height: 28.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
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
              width: 24.0,
              height: 28.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0),
                ),
                color: widgetColor.primaryColor,
              ),
              child: Text(
                'B',
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CircularStd-Book',
                    color: widgetColor.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
