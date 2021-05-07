import 'package:flutter/material.dart';

class ChangeTextSize extends ChangeNotifier {
  double textSize = 18;

  double get textsize1 => textSize;
  void changeSize(double newSize) {
    textSize = newSize;
    notifyListeners();
  }
}

class ChangeIconSize extends ChangeNotifier {
  double iconSize = 40;
  double get iconSize1 => iconSize;

  void changeSize(double newSize) {
    iconSize = newSize;
    notifyListeners();
  }
}
