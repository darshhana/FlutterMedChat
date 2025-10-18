import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class SliderviewItemWidget extends StatelessWidget {
  const SliderviewItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle33,
              height: 190.h,
              width: double.maxFinite,
              radius: BorderRadius.circular(
                20.h,
              ),
            ),
            Container(
              height: 190.h,
              width: 326.h,
            )
          ],
        ));
  }
}
