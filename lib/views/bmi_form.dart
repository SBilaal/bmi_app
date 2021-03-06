import 'package:bmi_app/bmi_result_view.dart';

import 'package:flutter/material.dart';
import 'package:bmi_app/bmi_calculator.dart';

class BMIInputForm extends StatefulWidget {
  _BMIInputFormState createState() => _BMIInputFormState();
}

class _BMIInputFormState extends State<BMIInputForm> {
  final _formKey = GlobalKey<FormState>();
  final focusNodex = FocusNode();
  List<dynamic> bmiStatus;
  String bmiValue;
  int bmiValueColor;
  BMICalculator calculator;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            height: 46.0,
            child: Text(
              'Calculate BMI',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
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
                    width: 1.0, height: 1.0, scale: 4.0),
                suffixText: 'Kg',
                controller: weightController,
                validatorText: 'weight',
                onEditingComplete: (){FocusScope.of(context).requestFocus(focusNodex);},),
            _CustomTextField(
              focusNode: focusNodex,
                hintText: 'Height',
                prefixIcon: Image.asset('images/height.png',
                    width: 1.0, height: 1.0, scale: 4.0),
                suffixText: 'm',
                controller: heightController,
                validatorText: 'height',),
            calculateButton,
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final String suffixText;
  final String validatorText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onEditingComplete;

  _CustomTextField(
      {this.hintText, this.prefixIcon, this.suffixText, this.controller, this.validatorText, this.focusNode, this.onEditingComplete,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty ||
              double.parse(value) > 999 ||
              RegExp(r'[^\w.]').hasMatch(value) ||
              double.parse(value) <= 0) {
            return 'Please enter a valid $validatorText.';
          }
        },
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 14.0, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          suffixText: suffixText,
          suffixStyle: TextStyle(
            color: Color(0xFFAEB4C0),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'CircularStd-Book',
          ),
          hintStyle: TextStyle(
            color: Color(0xFFAEB4C0),
            fontSize: 14.0,
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
