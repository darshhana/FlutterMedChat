import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../core/app_export.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
//importing login wala page ,2nd screen
import '../android_small_two_screen/android_small_two_screen.dart';

class AndroidSmallOneScreen extends StatefulWidget {
  const AndroidSmallOneScreen({super.key});

  @override
  State<AndroidSmallOneScreen> createState() => _AndroidSmallOneScreenState();
}

class _AndroidSmallOneScreenState extends State<AndroidSmallOneScreen> {
  double _progressValue = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _startProgressAnimation();
    //to navigate to login screen after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AndroidSmallTwoScreen()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startProgressAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        if (_progressValue < 1.0) {
          _progressValue += 0.02;
        } else {
          _progressValue = 1.0;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        body: SizedBox(
          // child: SizedBox(
          width: double.maxFinite,
          // child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 554.h,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.h,
                          vertical: 74.h,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              ImageConstant.bgCirclespng,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: 14.h,
                        //   vertical: 74.h,
                        // ),
                        // child: Stack(
                        //   children: [
                        //     //svg background image...
                        //     Positioned.fill(
                        //       left: 0,
                        //       top: 0,
                        //       child: SvgPicture.asset(
                        //         ImageConstant.bgCircles,

                        //      // Covers half the screen height
                        //         // fit: BoxFit.fitHeight,
                        //         fit: BoxFit.fitWidth,// Ensures it fits correctly
                        //         // alignment: Alignment.center,
                        //       ),
                        //     ),

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildLogoSection(context),
                            SizedBox(height: 116.h)
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //SizedBox(height: 100.h ),
                        _buildAnimationSection(context)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildProgressSection(context),
              SizedBox(height: 52.h)
            ],
          ),
        ),
      ),
    );
  }

//section widget.
  Widget _buildLogoSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
          horizontal: 16.h), // Optional for uniform padding
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrinks to fit content
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgAppmintLogo,
            height: 88.h,
            width: 90.h,
            radius: BorderRadius.circular(
              44.h,
            ),
            alignment: Alignment.center,
          ),
          SizedBox(height: 2.h),
          Text(
            "ChatRx",
            style: theme.textTheme.displaySmall,
          ),
        ],
      ),
    );
  }

  //section widget

  Widget _buildAnimationSection(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 34.h),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     CustomImageView(
      //       imagePath: ImageConstant.imgMedicineLottie,
      //       height: 288.h,
      //       width: 288.h,
      //     )
      //   ],
      // ),
      color: Colors
          .transparent, //adds the transparent background to animation only.
      child: Lottie.asset(
        'assets/animations/med_lottie_fin.json',
        height: 350.h,
        width: 350.h,
      ),
    );
  }

  //section widget, progess section...
  Widget _buildProgressSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            width: 40.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 40.h,
                  child: CircularProgressIndicator(
                    value: _progressValue, //to use dynamic progress value
                    strokeWidth: 4.0,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant
                      .imgAppmintLogo, // Temporarily using PNG instead of SVG
                  height: 20.h,
                  width: 20.h,
                  alignment: Alignment.topRight,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
