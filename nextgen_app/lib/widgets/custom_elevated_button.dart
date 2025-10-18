import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton(
      {Key? key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      EdgeInsets? margin,
      VoidCallback? onPressed,
      ButtonStyle? buttonStyle,
      Alignment? alignment,
      TextStyle? buttonTextStyle,
      bool? isDisabled,
      double? height,
      double? width,
      required String text, required ButtonStyle style})
      : super(
          text: text,
          onPressed: onPressed,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget)
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: this.height ?? 54.h,
        width: this.width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style:  ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary , //setss bg color from the app theme
            foregroundColor: Colors.white  , //setss text color from the app theme
          ),
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ?? CustomTextStyles.titleMediumOnPrimary,
              ),
              rightIcon ?? const SizedBox.shrink()
            ],
          ),
        ),
      );
}
