import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class CustomCheckboxButton extends StatelessWidget {
  CustomCheckboxButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.text,
    this.value,
    this.width,
    this.padding,
    this.textStyle,
    this.overflow,
    this.textAlignment,
    this.isExpandedText = false,
  }) : super(key: key);

  final BoxDecoration? decoration;
  final Alignment? alignment;
  final bool? isRightCheck;
  final double? iconSize;
  final String? text;
  bool? value;
  final double? width;
  final Function(bool)? onChange;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final TextAlign? textAlignment;
  final bool? isExpandedText;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildCheckBoxWidget)
        : buildCheckBoxWidget;
  }

  Widget get buildCheckBoxWidget => GestureDetector(
        onTap: onChange != null
            ? () {
                value = !(value!);
                onChange!(value!);
              }
            : null, // Disabled when onChange is null
        child: Container(
          decoration: decoration,
          padding: padding,
          width: width,
          child: (isRightCheck ?? false) ? rightSideCheckbox : leftSideCheckbox,
        ),
      );

  Widget get leftSideCheckbox => Row(
        children: [
          checkboxWidget,
          SizedBox(
            width: text?.isNotEmpty == true ? 8 : 0,
          ),
          isExpandedText == true ? Expanded(child: textWidget) : textWidget
        ],
      );

  Widget get rightSideCheckbox => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isExpandedText == true ? Expanded(child: textWidget) : textWidget,
          SizedBox(
            width: text?.isNotEmpty == true ? 8 : 0,
          ),
          checkboxWidget,
        ],
      );

  Widget get textWidget => Text(
        text ?? "",
        overflow: overflow,
        textAlign: textAlignment ?? TextAlign.start,
        style: (textStyle ?? CustomTextStyles.titleSmallPrimary).copyWith(
          color: onChange != null
              ? (textStyle ?? CustomTextStyles.titleSmallPrimary).color
              : (textStyle ?? CustomTextStyles.titleSmallPrimary)
                  .color
                  ?.withOpacity(0.6),
        ),
      );

  Widget get checkboxWidget => SizedBox(
        width: iconSize ?? 10.h,
        height: iconSize ?? 10.h,
        child: Checkbox(
          visualDensity: const VisualDensity(
            horizontal: -4,
            vertical: -4,
          ),
          value: value ?? false,
          checkColor: theme.colorScheme.primary,
          activeColor: onChange != null
              ? appTheme.gray300
              : appTheme.gray300.withOpacity(0.5),
          side: WidgetStateBorderSide.resolveWith(
            (states) => BorderSide(
              color: onChange != null
                  ? appTheme.gray300
                  : appTheme.gray300.withOpacity(0.5),
            ),
          ),
          onChanged: onChange != null
              ? (value) {
                  onChange!(value!);
                }
              : null, // Disabled when onChange is null
        ),
      );
}
