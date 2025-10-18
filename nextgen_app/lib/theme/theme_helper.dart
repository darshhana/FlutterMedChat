import 'package:flutter/material.dart';
import '../core/app_export.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();

//helper class for managing themes and colors

class ThemeHelper {
  //a map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  //a map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  //changes the app theme to [_newTheme]
  void changeTheme(String newTheme) {
    _appTheme = newTheme;
  }

  //returns the lightcode colors for the current theme
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  //returns the current theme data
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.gray10001,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: appTheme.gray300,
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colorScheme.primaryContainer,
      ),
    );
  }

  //returns the lightcode colours for the current theme
  LightCodeColors themeColor() => _getThemeColors();

  //returns the current theme data
  ThemeData themeData() => _getThemeData();
}

//class containing the suppoported text theme styles
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 16.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.primary,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 36.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 24.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray200,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 10.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray700,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

//class containing the supported color schemes
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF0D3D6D),
    primaryContainer: Color(0XFFB8B8B8),
    errorContainer: Color(0XFF414486),
    onPrimary: Color(0X19FFFFFF),
    onPrimaryContainer: Color(0XDD0D3D6D),
  );
}

//class containing custom colors for a lightcode theme.
class LightCodeColors {
  //blck
  Color get black90019 => const Color(0X19000000);
  //blue
  Color get blue30099 => const Color(0X9973B1EF);
  Color get blue700 => const Color(0XFF1876D4);
  //bluegray
  Color get blueGray10000 => const Color(0X00D9D9D9);
  //bluegrayc
  Color get blueGray1004c => const Color(0X4CD7D7D7);
  //gray
  Color get gray100 => const Color(0XFFF7F7F7);
  Color get gray10001 => const Color(0XFFF5F5F5);
  Color get gray10002 => const Color(0XFFF4F4F4);
  Color get gray200 => const Color(0XFFEAEAEA);
  Color get gray20001 => const Color(0XFFE7E7E7);
  Color get gray20002 => const Color(0XFFEEEEEE);
  Color get gray300 => const Color(0XFFE3E4E8);
  Color get gray30001 => const Color(0XFFDADADA);
  Color get gray400 => const Color(0XFFC7C7C7);
  Color get gray500 => const Color(0XFFACACAC);
  Color get gray50001 => const Color(0XFFA1A1A1);
  Color get gray700 => const Color(0XFF636363);

  //green
  Color get green300 => const Color(0XFF6CB291);

  //greendd
  Color get green400Dd => const Color(0XDD57A781);

  //indigo
  Color get indigo200 => const Color(0XFF9598D1);
}
