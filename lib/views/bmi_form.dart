import 'package:bmi_app/bmi_result_view.dart';
import 'package:bmi_app/views/bmi_result_display.dart';

import 'package:flutter/material.dart';
import 'package:bmi_app/bmi_calculator.dart';

class BMIInputForm extends StatefulWidget {
  _BMIInputFormState createState() => _BMIInputFormState();
}

class _BMIInputFormState extends State<BMIInputForm> {
  final _formKey = GlobalKey<FormState>();
  List<dynamic> bmiStatus;
  String bmiValue;
  int bmiValueColor;
  BMICalculator calculator;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final widgetColor = Theme.of(context);

    final calculateButton = Container(
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
          onTap: () {
            setState(() {
              if (_formKey.currentState.validate()) {
                calculator = BMICalculator(double.parse(weightController.text),
                    double.parse(heightController.text));
                calculator.calculateBMI();
                bmiStatus = calculator.bmiStatus;
                FocusScope.of(context).requestFocus(FocusNode());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BMIResultView(bmiStatus),
                  ),
                );
              }
            });
          },
          borderRadius: BorderRadius.circular(10.0),
          splashColor: Colors.white,
          highlightColor: Colors.white,
          child: Container(
            alignment: Alignment.center,
            height: deviceHeight * 0.070,
            child: Text(
              'Calculate BMI',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'CircularStd-Book',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: <Widget>[
            _CustomTextField(
                hintText: 'Weight',
                prefixIcon: Image.asset('images/weight.png',
                    width: 1.0, height: 1.0, scale: 3.0),
                suffixText: 'Kg',
                controller: weightController),
            _CustomTextField(
                hintText: 'Height',
                prefixIcon: Image.asset('images/height.png',
                    width: 1.0, height: 1.0, scale: 3.0),
                suffixText: 'm',
                controller: heightController),
            calculateButton,
            //ResultDisplay(result),
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  String hintText;
  Widget prefixIcon;
  String suffixText;
  TextEditingController controller;

  _CustomTextField(
      {this.hintText, this.prefixIcon, this.suffixText, this.controller});

  @override
  Widget build(BuildContext context) {
    final widgetColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty ||
              double.parse(value) > 999 ||
              RegExp(r'[^\w.]').hasMatch(value) ||
              double.parse(value) <= 0) {
            return 'Please enter a valid number';
          }
        },
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20.0, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          suffixText: suffixText,
          suffixStyle: TextStyle(
            color: Color(0xFFAEB4C0),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'CircularStd-Book',
          ),
          hintStyle: TextStyle(
            color: Color(0xFFAEB4C0),
            fontSize: 20.0,
            fontFamily: 'CircularStd-Book',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
