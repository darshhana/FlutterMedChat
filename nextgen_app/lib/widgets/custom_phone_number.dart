import 'package:flutter/material.dart';
// import 'package:country_pickers/country.dart';
import 'package:country_picker/country_picker.dart';
// import 'package:country_pickers/utils/utils.dart';
import '../core/app_export.dart';

class CustomPhoneNumber extends StatelessWidget {
  Country country;
  Function(Country) onTap;
  TextEditingController? controller;

  // Default to India if no country is provided
  CustomPhoneNumber({
    super.key,
    Country? country,
    required this.onTap,
    required this.controller,
  }) : country = country ?? Country.parse('IN');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        borderRadius: BorderRadius.circular(
          8.h,
        ),
        border: Border.all(
          color: theme.colorScheme.onPrimaryContainer,
          width: 1.h,
        ),
      ),
      child: Row(
        children: [
          // Disabled country picker - fixed to India
          InkWell(
            onTap: null, // Disabled tap functionality
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.h,
                  ),
                  child: Text(
                    "+${country.phoneCode}",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant
                      .imgAppmintLogo, // Temporarily using PNG instead of SVG
                  height: 4.h,
                  width: 10.h,
                  margin: EdgeInsets.only(
                    left: 6.h,
                    right: 6.h,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 1.h,
            height: 40.h,
            margin: EdgeInsets.only(left: 10.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
            ),
          ),
          Expanded(
            child: Container(
              width: 220.h,
              margin: EdgeInsets.only(left: 26.h),
              child: TextFormField(
                focusNode: FocusNode(),
                keyboardType: TextInputType.phone,
                autofocus: true,
                controller: controller,
                style: theme.textTheme.bodyMedium!,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: theme.textTheme.bodyMedium!,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 20.h,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget _buildDialogItem(Country country) => Row(
  //   children: <Widget>[
  //     CountryPickerUtils.getDefaultFlagImage(country),
  //     Container(
  //       margin: EdgeInsets.only(
  //         left: 10.h,
  //         ),
  //         width: 60.h,
  //         child: Text(
  //           "+${country.phoneCode}",
  //           style: TextStyle(fontSize: 14.fSize),
  //         ),
  //     ),
  //     const SizedBox(width: 8.0),
  //     Flexible(
  //       child: Text(
  //         country.name,
  //         style: TextStyle(fontSize: 14.fSize),
  //       ),
  //     )
  //   ],
  // );

  void _openCountryPicker(BuildContext context) //=> showDialog(
  //   context: context,
  //   builder: (context) => CountryPickerDialog(
  //     searchInputDecoration: InputDecoration(
  //       hintText: "Search Country",
  //       hintStyle: TextStyle(fontSize: 14.fSize),
  //     ),
  //     isSearchable: true,
  //     title: Text("Select your phone code",
  //     style: TextStyle(fontSize: 14.fSize)),
  //     onValuePicked: (Country country) => onTap(country),
  //     itemBuilder: _buildDialogItem,
  //   ),
  // );
  {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country selectedCountry) {
        onTap(selectedCountry);
      },
    );
  }
}
