import 'package:flutter/material.dart';
import '../../../core/app_export.dart';

class Gridbookappointment1ItemWidget extends StatelessWidget {
  const Gridbookappointment1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.3),
        borderRadius: BorderRadiusStyle.roundedBorder20,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90019,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle35,
            height: 90.h,
            width: 90.h,
            radius: BorderRadius.circular(
              20.h,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Book\nAppointment",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelMedium,
          ),
          SizedBox(height: 10.h)
        ],
      ),
    );
  }
}
