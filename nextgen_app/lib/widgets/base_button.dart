import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
    {Key? key,
    required this.text,
    this.onPressed,
    this.buttonStyle,
    this.buttonTextStyle,
    this.isDisabled,
    this.height,
    this.width,
    this.alignment,
    this.margin})
    : super(key: key,
    );
  
  final String text;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? buttonTextStyle;
  final bool? isDisabled;
  final double? height;
  final double? width;
  final Alignment? alignment;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: isDisabled ?? false ? null : onPressed,
      child: Text(
        text, 
        style: buttonTextStyle ?? Theme.of(context).textTheme.labelLarge,
        ),
    );
  }
}
