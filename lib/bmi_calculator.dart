class BMICalculator {
  double _weight;
  double _height;
  String _result;
  String _bmiValue;
  int _bmiValueColor;
  List<dynamic> _bmiStatus = [];
  List<int> _bmiValueColors = [0x0FFA8072, 0x0F0DEEDB, 0x0FFFA500, 0x0FFF0000];
  List<String> _bmiValues = ["You're Underweight.", "You're Healthy.", "You're Overweight.", "You're Obese."];

  String get bmiValue => _bmiValue;
  int get bmiValueColor => _bmiValueColor;
  String get result => _result;
  List<dynamic> get bmiStatus => _bmiStatus;

  BMICalculator(this._weight, this._height);


  calculateBMI() {
    _result = (_weight / (_height * _height)).toStringAsFixed(3);
    _interpreteBMIResult();
  }

  void _interpreteBMIResult() {
    if(double.parse(_result) < 18.5) {
      _bmiValue = _bmiValues[0];
      _bmiValueColor = _bmiValueColors[0];
    } else if(double.parse(_result) >= 18.5 && double.parse(_result) < 25) {
      _bmiValue = _bmiValues[1];
      _bmiValueColor = _bmiValueColors[1];
    } else if(double.parse(_result) >= 25 && double.parse(_result) < 30) {
      _bmiValue = _bmiValues[2];
      _bmiValueColor = _bmiValueColors[2];
    } else {
      _bmiValue = _bmiValues[3];
      _bmiValueColor = _bmiValueColors[3];
    }
    bmiStatus.add(_result);
    bmiStatus.add(_bmiValue);
    bmiStatus.add(_bmiValueColor);
  }
}
