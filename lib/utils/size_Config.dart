import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth;
  static double _blockHeight;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    print("The Height of your phone is " + _blockHeight.toString());
    print("The Width of your phone is " + _blockWidth.toString());
  }
}
