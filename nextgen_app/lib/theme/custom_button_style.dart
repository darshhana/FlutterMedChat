import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomButtonStyles {
  static ButtonStyle none = ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      elevation: WidgetStateProperty.all<double>(0),
      padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      side: WidgetStateProperty.all<BorderSide>(
        BorderSide(color: Colors.transparent),
      ));
}
