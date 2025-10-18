import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../theme/app_decoration.dart';

class AndroidSmallFiveScreen extends StatelessWidget {
  AndroidSmallFiveScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController firstnameInputController = TextEditingController();
  TextEditingController lastnameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  TextEditingController phoneInputController = TextEditingController();
  List<String> dropdownItemList = ["item one", "item two", "item three"];
  List<String> dropdownItemList1 = ["item one", "item two", "item three"];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                  children: [
                    Text(
                      "User Profile",
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.h,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary.withOpacity(1),
                        borderRadius: BorderRadiusStyle.roundedBorder16,
                        boxShadow: [
                          BoxShadow(
                            color: appTheme.black90019,
                            spreadRadius: 2.h,
                            blurRadius: 2.h,
                            offset: Offset(
                              0,
                              2,
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildFirstnameTextField(context),
                          SizedBox(height: 12.h),
                          _buildLastnameTextField(context),
                          SizedBox(height: 12.h),
                          _buildEmailTextField(context),
                          SizedBox(height: 12.h),
                          _buildPhoneTextField(context),
                          SizedBox(height: 12.h),
                          _buildGenderDOBDropDown(context),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.h),
                            child: CustomDropDown(
                              hintText: "Select your Preferred Language ",
                              items: dropdownItemList1,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.h,
                                vertical: 16.h,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 56.h)
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildUpdateSection(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 31.h,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context); //navigates to previous screen.
        },
        child: AppbarLeadingImage(
          imagePath: ImageConstant
              .imgAppmintLogo, // Temporarily using PNG instead of SVG
          margin: EdgeInsets.only(left: 23.h),
        ),
      ),
    );
  }

  Widget _buildFirstnameTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: CustomTextFormField(
        controller: firstnameInputController,
        hintText: "Enter your First Name",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildLastnameTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: CustomTextFormField(
        controller: lastnameInputController,
        hintText: "Enter your Last Name",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildEmailTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: CustomTextFormField(
        controller: emailInputController,
        hintText: "Enter your Email",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildPhoneTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: CustomTextFormField(
        controller: phoneInputController,
        hintText: "Enter your Phone Number",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 16.h,
        ),
      ),
    );
  }

  Widget _buildGenderDOBDropDown(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      width: double.maxFinite,
      child: Row(
        children: [
          CustomDropDown(
            width: 98.h,
            hintText: "Male",
            items: dropdownItemList,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 16.h,
            ),
          ),
          SizedBox(width: 12.h),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder8,
                border: Border.all(
                  color: theme.colorScheme.primaryContainer,
                  width: 1.h,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "15",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 8.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "Aug",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    indent: 4.h,
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 4.h),
                    child: Text(
                      "2003",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: VerticalDivider(
                      width: 1.h,
                      thickness: 1.h,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant
                        .imgAppmintLogo, // Temporarily using PNG instead of SVG
                    height: 20.h,
                    width: 20.h,
                    margin: EdgeInsets.only(left: 10.h),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUpdateButton(BuildContext context) {
    return CustomElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      text: "Update",
      margin: EdgeInsets.only(bottom: 12.h),
      buttonStyle: CustomButtonStyles.none,
      onPressed: () {},
    );
  }

  Widget _buildUpdateSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildUpdateButton(context)],
      ),
    );
  }

  // onTapUpdateButton(BuildContext context) {
  //   Navigator.pushNamed(context, AppRoutes.androidSmallSixScreen);
  // }
}
