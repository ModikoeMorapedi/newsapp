import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double blockWidth;
  static double blockHeight;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    }

    blockWidth = _screenWidth / 100;
    blockHeight = _screenHeight / 100;

    print("The Height of your phone is " + blockHeight.toString());
    print("The Width of your phone is " + blockWidth.toString());
  }
}
