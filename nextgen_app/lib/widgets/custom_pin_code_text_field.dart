import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
 

  CustomPinCodeTextField(
      {Key? key,
      required this.context,
      required this.onChanged,
      this.alignment,
      this.controller,
      this.textStyle,
      this.hintStyle,
      this.validator,})
      : super(
          key: key,
        );
  // final TextInputType? keyboardType;
  final Alignment? alignment;
  final TextEditingController? controller;
  final BuildContext context;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget)
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => PinCodeTextField(
        appContext: context,
        length: 6,
        // keyboardType: keyboardType ?? TextInputType.number,
        controller: controller ?? TextEditingController(),
        // textStyle: textStyle ?? CustomTextStyles.OnPrimary,
        textStyle: TextStyle(
          color: Colors.blueAccent,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        hintStyle: hintStyle ?? CustomTextStyles.OnPrimary,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 52.h,
          fieldWidth: 42.h,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.h),
          inactiveColor: theme.colorScheme.primaryContainer,
          inactiveFillColor: theme.colorScheme.onPrimary.withOpacity(1),
          activeColor: theme.colorScheme.primaryContainer,
          activeFillColor: theme.colorScheme.onPrimary.withOpacity(1),
          selectedColor: theme.colorScheme.primaryContainer,
          selectedFillColor: theme.colorScheme.onPrimary.withOpacity(1),
        ),
        onChanged: (value) => onChanged!(value),
        validator: validator,
      );
}
