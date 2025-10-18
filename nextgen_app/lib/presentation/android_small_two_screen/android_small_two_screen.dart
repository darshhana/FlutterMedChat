import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_phone_number.dart';

//ignore_for_file: must_be_immutable
class AndroidSmallTwoScreen extends StatefulWidget {
  AndroidSmallTwoScreen({super.key});

  @override
  State<AndroidSmallTwoScreen> createState() => _AndroidSmallTwoScreenState();
}

class _AndroidSmallTwoScreenState extends State<AndroidSmallTwoScreen> {
  // Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('91');
  Country? selectedCountry = Country.parse('IN'); // Fixed to India

  TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    //adding a listener to the phone number controller
    phoneNumberController.addListener(() {
      if (phoneNumberController.text.length == 10) {
        //dismissing the keyboard
        FocusScope.of(context).unfocus();
        //getting the phone number(for a seamless ux, as user do not need to enter it twice))
        String phoneNumber = phoneNumberController.text;
        // Navigating to the next screen
        Navigator.pushNamed(context, AppRoutes.androidSmallThreeScreen,
            arguments: phoneNumber);
      }
    });
  }

  // Show trouble signing in dialog
  void _showTroubleSigningInDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFE3F2FD), // Light blue theme
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.help_outline,
                  color: Color(0xFF1976D2), // Blue theme
                  size: 20,
                ),
              ),
              SizedBox(width: 12),
              Text(
                "Need Help?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Having trouble signing in? Here are some solutions:",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 16),
              _buildHelpOption(
                icon: Icons.phone,
                title: "Call Support",
                subtitle: "+91 98765 43210",
                onTap: () {
                  Navigator.of(context).pop();
                  // You can add phone call functionality here
                },
              ),
              SizedBox(height: 12),
              _buildHelpOption(
                icon: Icons.email,
                title: "Email Support",
                subtitle: "support@chatrx.com",
                onTap: () {
                  Navigator.of(context).pop();
                  // You can add email functionality here
                },
              ),
              SizedBox(height: 12),
              _buildHelpOption(
                icon: Icons.info_outline,
                title: "Common Issues",
                subtitle: "Check your internet connection",
                onTap: () {
                  Navigator.of(context).pop();
                  _showCommonIssuesDialog();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Close",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHelpOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFE0E0E0)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                icon,
                color: Color(0xFF1976D2),
                size: 16,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  void _showCommonIssuesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Common Issues",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIssueItem("📱", "Check your phone number format"),
              _buildIssueItem("📶", "Ensure stable internet connection"),
              _buildIssueItem("⏰", "Wait a few minutes and try again"),
              _buildIssueItem("🔄", "Restart the app if needed"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Got it",
                style: TextStyle(
                  color: Color(0xFF1976D2),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildIssueItem(String emoji, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(emoji, style: TextStyle(fontSize: 16)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary.withOpacity(1),
        body: SizedBox(
          height: double.maxFinite,
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 740.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 486.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgRectangle2,
                                height: 486.h,
                                width: double.maxFinite,
                              ),
                              Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(bottom: 10.h),
                                padding: EdgeInsets.only(
                                  left: 22.h,
                                  top: 66.h,
                                  bottom: 66.h,
                                ),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "Consult doctor from \ncomfort of your home..",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.headlineSmall,
                                    ),
                                    SizedBox(height: 18.h),
                                    SizedBox(
                                      height: 8.h,
                                      child: AnimatedSmoothIndicator(
                                        activeIndex: 0,
                                        count: 4,
                                        effect: ScrollingDotsEffect(
                                          spacing: 6.23,
                                          activeDotColor: theme
                                              .colorScheme.onPrimary
                                              .withOpacity(1),
                                          dotColor: appTheme.indigo200,
                                          activeDotScale: 1.33333333333333,
                                          dotHeight: 6.h,
                                          dotWidth: 6.h,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      _buildGetStartedSection(context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //section widget
  Widget _buildGetStartedSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 24.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.gray10001,
        borderRadius: BorderRadiusStyle.customBorderTL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lets's get started! Enter your Mobile Number",
            style: CustomTextStyles.titleSmallPrimary,
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              // Disabled country picker - fixed to India
              Row(
                children: [
                  Text(
                    '🇮🇳 +91', // Fixed to Indian flag and code
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  // Removed dropdown arrow icon
                ],
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                      fontSize: 16.fSize, color: theme.colorScheme.primary),
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle:
                        TextStyle(fontSize: 16.fSize, color: Colors.grey[400]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   width: double.maxFinite,
          //   child: CustomPhoneNumber(
          //     country: selectedCountry,
          //     controller: phoneNumberController,
          //     onTap: (Country value){
          //       selectedCountry = value;
          //     },
          //   ),
          // ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              _showTroubleSigningInDialog();
            },
            child: Text(
              "Trouble signing in?",
              style: theme.textTheme.titleSmall!.copyWith(
                decoration: TextDecoration.underline,
                color: Color(0xFF1976D2), // Blue theme
              ),
            ),
          ),
          SizedBox(height: 114.h)
        ],
      ),
    );
  }
}
