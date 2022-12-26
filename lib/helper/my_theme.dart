import 'package:flutter_mdetect/flutter_mdetect.dart';
import 'package:rabbit_converter/rabbit_converter.dart';

class MyTheme {
  static String mmText(String text) {
    //  MyTheme.mmText
    return MDetect.isUnicode() ? text : Rabbit.uni2zg(text);
  }
}
