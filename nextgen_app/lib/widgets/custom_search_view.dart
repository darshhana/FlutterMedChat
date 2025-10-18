import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../core/app_export.dart';

class CustomSearchView extends StatelessWidget {
  CustomSearchView(
      {Key? key,
      this.alignment,
      this.width,
      this.boxDecoration,
      this.scrollPadding,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.textStyle,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.hintStyle,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.contentPadding,
      this.borderDecoration,
      this.fillColor,
      this.filled = true,
      this.validator,
      this.onChanged})
      : super(
          key: key,
        );

  final Alignment? alignment;
  final double? width;
  final BoxDecoration? boxDecoration;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: searchViewWidget(context))
        : searchViewWidget(context);
  }

  Widget searchViewWidget(BuildContext context) => Container(
        width: width ?? double.maxFinite,
        decoration: boxDecoration,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) {
            if (focusNode != null) {
              focusNode?.unfocus();
            } else {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          autofocus: autofocus!,
          style: textStyle ?? theme.textTheme.bodyMedium,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          onChanged: (String value) {
            onChanged?.call(value);
          },
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodyMedium,
        prefixIcon: Padding(
          padding: EdgeInsets.all(
            15.h,
          ),
          child: Icon(
            Icons.search,
            color: Colors.grey.shade600,
          ),
        ),
        prefixIconConstraints: prefixConstraints ??
            BoxConstraints(
              maxHeight: 40.h,
            ),
        suffixIcon: suffix ??
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 14.h,
              ),
              child: CustomImageView(
                imagePath: ImageConstant
                    .imgAppmintLogo, // Temporarily using PNG instead of SVG
                height: 12.h,
                width: 12.h,
              ),
            ),
        suffixIconConstraints: suffixConstraints ??
            BoxConstraints(
              maxHeight: 40.h,
            ),
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.all(10.h),
        fillColor: fillColor ?? theme.colorScheme.onPrimary.withOpacity(1),
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(
                color: appTheme.gray20002,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.h),
              borderSide: BorderSide(
                color: appTheme.gray20002,
                width: 1,
              ),
            ),
        focusedBorder: (borderDecoration ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.h),
                ))
            .copyWith(
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 1,
          ),
        ),
      );
}
