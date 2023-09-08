import 'package:flutter/cupertino.dart';

class NumbericProvider with ChangeNotifier {
  static int number = 0;

  set setNumber(int value) {
    number = value;
    notifyListeners();
  }

  get getNumber => number;
}
