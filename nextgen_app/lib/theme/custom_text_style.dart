import 'package:flutter/material.dart';

import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}

//a collectionof predefined text styles for customizing text appearance, categorized by different font families and weights.
//additionalyy, this class included extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  //text style
  static TextStyle get OnPrimary => TextStyle(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );

  //body text style
  static TextStyle get bodyLargePoppinsGray400 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.gray400,
      );

  static TextStyle get bodyMediumOnPrimary =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );

  static TextStyle get bodyMediumPrimary =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static TextStyle get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray400,
      );

  static TextStyle get bodySmallOnPrimary =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 8.fSize,
      );

  static TextStyle get bodySmallPrimaryContainer =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontSize: 8.fSize,
      );

  //roboto text style
  static TextStyle get robotoOnPrimary => TextStyle(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 86.fSize,
        fontWeight: FontWeight.w400,
      ).roboto;

  //title text style
  static TextStyle get titleLargeGray200 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray200,
      );

  static TextStyle get titleMediumGray200 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray200,
      );

  static TextStyle get titleMediumOnPrimary =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );

  static TextStyle get titleSmallErrorContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );

  static TextStyle get titleSmallErrorContainer_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );

  static TextStyle get titleSmallGray500 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray500,
      );

  static TextStyle get titleSmallPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );

  static TextStyle get titleSmallPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );

  
}
