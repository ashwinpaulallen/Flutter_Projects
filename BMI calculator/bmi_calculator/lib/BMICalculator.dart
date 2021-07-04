import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;

  double _bmi = 0;

  CalculateBMI({required this.height, required this.weight});

  String bmiMath() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "Normal";
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return "Normal";
    } else {
      return 'UnderWeight';
    }
  }
}
