import 'package:flutter/material.dart';

class TBaseUtils {
  static void showSnackbar({required String message, required BuildContext context, int seconds = 5}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: seconds),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

 
}
