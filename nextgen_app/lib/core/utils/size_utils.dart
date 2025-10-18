
import 'package:flutter/material.dart';

// these are used in the code as a reference to create the UI responsively.
const num FIGMA_DESIGN_WIDTH = 360;
const num FIGMA_DESIGN_HEIGHT = 640;
const num FIGMA_DESIGN_STATUS_BAR = 0;

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);
  double get fSize => ((this * _width) / FIGMA_DESIGN_WIDTH);
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  const Sizer({super.key, required this.builder});

//builds the widget whenever the orientation changes.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

class SizeUtils {
  //devices boxconstraints
  static late BoxConstraints boxConstraints;

  //devices orientation
  static late Orientation orientation;

  //type of device
  //this can be either a mobile or tablet
  static late DeviceType deviceType;

  //devices height
  static late double height;

  //devices width
  static late double width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    if (orientation == Orientation.portrait) {
      width =
          boxConstraints.maxWidth.isNonZero(defaultValue: FIGMA_DESIGN_WIDTH);
      height = boxConstraints.maxWidth.isNonZero();
    } else {
      width =
          boxConstraints.maxHeight.isNonZero(defaultValue: FIGMA_DESIGN_HEIGHT);
      height = boxConstraints.maxWidth.isNonZero();
    }
    deviceType = DeviceType.mobile;
  }
}
