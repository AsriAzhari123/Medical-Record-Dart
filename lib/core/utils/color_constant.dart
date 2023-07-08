import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#797979');

  static Color black9004c = fromHex('#4c000000');

  static Color gray700 = fromHex('#585858');

  static Color blueGray400 = fromHex('#918686');

  static Color gray800 = fromHex('#4c4c4c');

  static Color lightGreenA700 = fromHex('#5cbd10');

  static Color lightGreen100 = fromHex('#e0ffc8');

  static Color lightGreenA100 = fromHex('#caffa0');

  static Color lightGreen10001 = fromHex('#e0ffc7');

  static Color black9003f = fromHex('#3f000000');

  static Color gray100 = fromHex('#f6f6f6');

  static Color green400 = fromHex('#45fc6d');

  static Color lightGreenA70001 = fromHex('#4aff47');

  static Color black900 = fromHex('#000000');

  static Color gray10001 = fromHex('#f3f3f3');

  static Color lightGreen700 = fromHex('#61b41f');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color cyan400 = fromHex('#28cae0');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
