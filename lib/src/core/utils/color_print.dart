import 'package:flutter/material.dart';

class TColorPrint {
  TColorPrint._();
  static void yellow(String text) {
    debugPrint('\x1B[33m$text\x1B[0m');
  }

  static void red(String text) {
    debugPrint('\x1B[31m$text\x1B[0m');
  }

  static void green(String text) {
    debugPrint('\x1B[92m$text\x1B[0m');
  }

  static void brightWhite(String text) {
    debugPrint('\x1B[97m$text\x1B[0m');
  }

  static void cyan(String text) {
    debugPrint('\x1B[36m$text\x1B[0m');
  }
}
