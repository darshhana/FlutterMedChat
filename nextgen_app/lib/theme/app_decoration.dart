import 'package:flutter/material.dart';
import "../core/app_export.dart";

class AppDecoration {
  //fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray10001,
      );
  static BoxDecoration get fillGray10002 => BoxDecoration(
        color: appTheme.gray10002,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  //gradient decorations
  static BoxDecoration get gradientBlueGrayToPrimary => BoxDecoration(
        border: Border.all(
          color: appTheme.gray100,
          width: 1.h,
        ),
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            appTheme.blueGray10000,
            theme.colorScheme.primary.withOpacity(0)
          ],
        ),
      );

  //outline decoration
  static BoxDecoration get outlineBlack => BoxDecoration(
        color : theme.colorScheme.onPrimary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              2,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack90019 => BoxDecoration(
        color: appTheme.blue30099,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              2,
            ),
          )
        ],
      );

  static BoxDecoration get outlineBlack900191 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              2,
              0,
            ),
          )
        ],
      );

  static BoxDecoration get outlineBlack900192 => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
      );

  static BoxDecoration get outlineBlueGrayC => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(0.6),
        border: Border.all(
          color: appTheme.blueGray1004c,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
      );

  static BoxDecoration get outlineGray => BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        border: Border.all(
          color: appTheme.gray100,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          )
        ],
      );

  static BoxDecoration get outlineOnPrimary => BoxDecoration(
        color: appTheme.blue30099,
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              2,
            ),
          )
        ],
      );

  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      );

  static BoxDecoration get outinePrimaryContainer => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primaryContainer,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlinePrimaryContainer1 => BoxDecoration(
        color: appTheme.green400Dd,
        border: Border.all(
          color: theme.colorScheme.primaryContainer.withOpacity(0.2),
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              2,
            ),
          )
        ],
      );
}

class BorderRadiusStyle {
  //circle borders
  static BorderRadius get circleBorder44 => BorderRadius.circular(
        44.h,
      );

  //custom borders
  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20.h),
      );

  //rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );

  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );

  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );

  static BorderRadius get roundedBorder24 => BorderRadius.circular(
        24.h,
      );

  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );

  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );


}
