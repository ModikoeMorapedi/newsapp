import 'package:newsapp/utils/size_Config.dart';

class Sizes {
  //This calculations were made according to the phone screen from the XD Height = 683, Width = 411
  //They are used to make the UI Responsive across all the phone screen sizes
  //Body means the space between the Top and Bottom navigation bar
  //start

  //Total phone width
  static double phoneWidth = SizeConfig.blockWidth * 100;
  // Total phone height
  static double phoneHeight = SizeConfig.blockHeight * 100;

  //App Body Text Sizes
  static double textBodySize_36 = phoneHeight * 6.5;
  static double textBodySize_32 = phoneHeight * 5.7;
  static double textBodySize_30 = phoneHeight * 5.4;
  static double textBodySize_29 = phoneHeight * 5.2;
  static double textBodySize_28 = phoneHeight * 5.0;
  static double textBodySize_26 = phoneHeight * 4.7;
  static double textBodySize_24 = phoneHeight * 4.3;
  static double textBodySize_22 = phoneHeight * 3.9;
  static double textBodySize_20 = phoneHeight * 3.4;
  static double textBodySize_18 = phoneHeight * 3.2;
  static double textBodySize_16 = phoneHeight * 2.9;
  static double textBodySize_14 = phoneHeight * 2.5;
  static double textBodySize_12 = phoneHeight * 2.2;
  static double textBodySize_10 = phoneHeight * 1.8;
  static double textBodySize_08 = phoneHeight * 1.4;
  static double textBodySize_06 = phoneHeight * 1.0;
  static double textBodySize_04 = phoneHeight * 0.7;
  static double textBodySize_02 = phoneHeight * 0.35;
  //////End///////

}
