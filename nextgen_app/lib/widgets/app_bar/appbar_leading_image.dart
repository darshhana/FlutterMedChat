import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage(
      {Key? key,
      this.imagePath,
      this.margin,
      this.onTap,
      this.height,
      this.width})
      : super(
          key: key,
        );
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final String? imagePath;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: CustomImageView(
          imagePath: imagePath,
          height: height,
          width: width,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
