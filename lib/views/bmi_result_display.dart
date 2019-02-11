import 'package:flutter/material.dart';

class ResultDisplay extends StatefulWidget {
  String result = '0.0';

  ResultDisplay(this.result);

  @override
  ResultDisplayState createState() {
    return new ResultDisplayState();
  }
}

class ResultDisplayState extends State<ResultDisplay> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final widgetColor = Theme.of(context);

    return Container(
      margin: EdgeInsets.fromLTRB(0.0, deviceHeight * 0.20, 0.0, 20.0),
      decoration: BoxDecoration(
        border: Border.all(color: widgetColor.primaryColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Color(0x0D538CFF),
        color: widgetColor.primaryColor,
        elevation: 3.0,
        child: InkWell(
          onLongPress: () {
            setState(() {
              widget.result = '0.0';
            });
          },
          borderRadius: BorderRadius.circular(10.0),
          splashColor: Colors.white,
          highlightColor: Colors.white,
          child: Container(
            alignment: Alignment.center,
            height: deviceHeight * 0.077,
            child: Text(
              '${widget.result} BMI',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}
