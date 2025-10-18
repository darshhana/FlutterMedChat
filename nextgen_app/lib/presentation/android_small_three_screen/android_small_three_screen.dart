import 'package:flutter/material.dart';
import 'package:nextgen_app/presentation/android_small_four_screen/android_small_four_screen.dart';
import 'package:nextgen_app/presentation/android_small_two_screen/android_small_two_screen.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uuid/uuid.dart'; // Add this import for UUID
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart'; // Required for rootBundle
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AndroidSmallThreeScreen extends StatefulWidget {
  @override
  _AndroidSmallThreeScreenState createState() =>
      _AndroidSmallThreeScreenState();
}

class _AndroidSmallThreeScreenState extends State<AndroidSmallThreeScreen> {
// @override
// void initState() {
//   super.initState();

//   rootBundle
//       .loadString('assets/animations/doc_loading1.json')
//       .then((data) => print("JSON loaded: ${data.substring(0, 100)}"))
//       .catchError((error) => print("Error loading JSON: $error"));
// }

  bool _isLoading = false;
  // texteditingcontroller to capture phone number input
  final TextEditingController _phoneController = TextEditingController();

  // function to send otp to the entered phone number
  Future<void> sendOtp(BuildContext context) async {
    final TextEditingController _otpController = TextEditingController();
    final String? phnum = ModalRoute.of(context)?.settings.arguments as String?;
    //showing error if phone number is empty
    _otpController.clear();
    print("pehle hee khali kar liya hai...");
    if (phnum == null || phnum.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter a valid phone number'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    try {
      // String? sessionCookie;
      // String countryCode = '+91';
      final uuid = Uuid().v4(); // Generate a unique UUID
      // final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      // String final_phoneNumber = countryCode + phnum;
      String final_phoneNumber = ('+91$phnum'); // the phone number
      print("final phone number:  $final_phoneNumber");

      final url = Uri.parse(
          'https://api.appment.in/api/patient/user/otp/$final_phoneNumber?nonce=$uuid');

      // final url = Uri.parse(
      //     'https://api.appment.in/api/patient/user/otp/$final_phoneNumber');
      Map<String, String> headers = {
        'X-Device': 'ANDROID_$uuid',
        'X-App-Version': '5.0.0',
        'Accept': '*/*',
        'Cache-Control': 'no-cache, no-store', // Prevent caching
        'Pragma': 'no-cache',
      };
      var response = await http.post(
        url,
        // body: jsonEncode({'phone': phnum}),
        headers: headers,
        body: '',
      );

      // Print the response status code and body for debugging
      print("url: $url");
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      print("response : ${response.headers}");

      if (response.statusCode == 204) {
        //204 here, as our api response is empty
        // sessionCookie = headers['Cookie'];
        // if (sessionCookie != null) {
        //   print("Session Cookie mila hai for api1 $sessionCookie");
        // } else {
        //   print("Session Cookie mila nahi hai for api1");
        // }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "OTP sent successfullly!",
            style: TextStyle(color: Colors.white10),
          ),
          backgroundColor: Colors.blue[700],
        ));

        //navigating to next screen after otp is successfully sent.
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AndroidSmallFourScreen(phoneNumber: phnum)),
        );
      } else {
        //handling error response from API
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to send OTP!"),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      //handling any exceptions that occurred during the API call
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("An error occurred: $e"),
        backgroundColor: Colors.red,
      ));
    }
  }

  void sendOtpWithFirebase(BuildContext context) async {
    final String phoneNumber = phoneNumberController.text.trim();

    if (phoneNumber.isEmpty || phoneNumber.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid phone number')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91$phoneNumber", // Add your country code
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto verification (especially on Android)
          await FirebaseAuth.instance.signInWithCredential(credential);
          print("Auto-verified & signed in");

          // Directly navigate to next screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AndroidSmallFourScreen(phoneNumber: phoneNumber),
            ),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification failed: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          print("Code sent. Verification ID: $verificationId");

          // Navigate to OTP input screen (Screen 4)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AndroidSmallFourScreen(
                phoneNumber: phoneNumber,
                // verificationId: verificationId, // pass this
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("Timeout: $verificationId");
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  Future<void> sendOtp2(BuildContext context) async {
    final TextEditingController _otpController = TextEditingController();
    final String? phnum = ModalRoute.of(context)?.settings.arguments as String?;

    // Clear the OTP field
    _otpController.clear();
    print("OTP field cleared");
    print("otp ke andar: ${_otpController.text}");
    // Show error if phone number is empty
    if (phnum == null || phnum.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter a valid phone number'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });
      // Format the phone number with country code
      String final_phoneNumber = phnum; // Add country code
      print("Final phone number: $final_phoneNumber");
      final uuid = Uuid().v4();
      // Construct the URL (without timestamp and nonce)
      final url = Uri.parse(
          'https://api.appment.in/api/patient/user/otp/$final_phoneNumber?nonce=$uuid');

      // Headers as per Postman
      Map<String, String> headers = {
        'X-Device': 'ANDROID',
        'X-App-Version': '5.0.0',
        'Accept': '*/*',
        'Cache-Control': 'no-cache, no-store', // Prevent caching
        'Pragma': 'no-cache',
      };

      // Log the full request
      print("Request URL: $url");
      print("Request Headers: $headers");

      // Send a POST request with an empty body
      var response = await http.post(
        url,
        headers: headers,
        body: '', // Empty body as per Postman
      );

      // Print the response status code and body for debugging
      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      print("Response Headers: ${response.headers}");

      //api ka kaam ho gaya isliye...
      setState(() {
        _isLoading = false;
      });
      if (response.statusCode == 204) {
        // OTP sent successfully
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("OTP sent successfully!"),
            backgroundColor: Colors.green,
          ),
        );

        // Navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AndroidSmallFourScreen(phoneNumber: phnum)),
        );
      } else {
        // Handle error response from API
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to send OTP!"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle any exceptions that occurred during the API call
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  TextEditingController phoneNumberController = TextEditingController();
  bool termsConditionsCheckbox = true; // Always true - disabled for now
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //retrieving  the phone number passed from the previous screen to get it autofilled here.
    final String? phoneNumber =
        ModalRoute.of(context)?.settings.arguments as String?;
    if (phoneNumber != null && phoneNumber.isNotEmpty) {
      phoneNumberController.text = phoneNumber;
    }

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            // backgroundColor: appTheme.colorFFF5F5, // Match Figma background
            appBar: _buildAppBar(context),
            body: Form(
              key: _formKey,
              // child: SizedBox(
              // width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 24.h),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: 22.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Text(
                          //     "Verification",
                          //     style: theme.textTheme.titleLarge,
                          //   ),
                          // ),
                          SizedBox(height: 32.h),
                          CustomTextFormField(
                            controller: phoneNumberController,
                            hintText: "Enter your Phone number or Email ID",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.phone,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.h,
                              vertical: 16.h,
                            ),
                            // style: TextStyle(color: Colors.black),
                            // decoration: InputDecoration(
                            //   hintText: "Enter your Phone Number or Email!",
                            //   hintStyle: TextStyle(
                            //       color: Colors.grey), // Set hint text color
                            // ),
                            // autofillHints: [AutofillHints.telephoneNumber],
                            // cursorColor:
                            //     Colors.blue, //autofilling the phone numbers.
                          ),
                          SizedBox(height: 18.h),
                          Text(
                            "By logging in you accept",
                            style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(height: 6.h),
                          _buildTermsConditionsCheckbox(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // ),
            ),
            bottomNavigationBar: _buildSendOtpSection(context),
          ),

          //loader overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.4),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SpinKitDoubleBounce(
                      //or try spinkitpulse
                      color: theme.colorScheme.primary,
                      size: 60.0,
                    ),
                    // SizedBox(height: 16.h),
                    //   Text(
                    //     "sending otp...",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 16.fSize,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                  ],
                ),

                //                   CircularProgressIndicator(
                //                     valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                // backgroundColor: Colors.white.withOpacity(0.3),
                // strokeWidth: 5,
                //                   ),
                // Lottie.asset(
                //   'assets/animations/doc_loading2.json',
                //   width: 100,
                //   height: 100,
                //   fit: BoxFit.contain,
              ),

              // Icon(Icons.local_hospital, color: Colors.white, size: 32.h),
            ),
        ],
      ),
    );
  }

//section widget
  //  PreferredSizeWidget _buildAppBar(BuildContext context) {
  // //   return CustomAppBar(
  // //     leadingWidth: 50.h, // Increase width for larger arrow space
  // //     leading: GestureDetector(
  // //       onTap: () {
  // //         Navigator.push(
  // //           context,
  // //           MaterialPageRoute(builder: (context) => AndroidSmallTwoScreen()),
  // //         ); // Navigate to the previous screen
  // //       },
  // //       child: Padding(
  // //         padding: EdgeInsets.only(left: 5.h, top: 10.h), // Align to top-left
  // //         child: SizedBox(
  // //           height: 30.h, // Set desired arrow size
  // //           width: 30.h,
  // //           child: AppbarLeadingImage(
  // //             imagePath: ImageConstant.imgVector3, // Path to back arrow asset
  // //           ),
  // //         ),
  // //       ),
  // //     ),
  // //   );
  // // }

  // return AppBar(
  //   leading: IconButton(
  //     icon: Icon(Icons.arrow_back),
  //     onPressed: () {
  //       Navigator.pop(context);  // Go back to previous screen
  //     },
  //   ),
  //   title: Text('Verification'),  // Customize title if needed
  //   centerTitle: true,  // Optional: center the title
  //   // You can add other AppBar properties here if needed
  // );
// }

//the real appbar.
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 74.h, // Scales with screen height
      // styleType: Style.,
      // leadingWidth: 45.h,
      //
      title: Padding(
        padding: EdgeInsets.only(left: 10.h, top: 40.h, right: 20.h),
        child: Row(
          children: [
            InkWell(
              borderRadius:
                  BorderRadius.circular(30.h), // makes it tappable in a circle
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 36.h,
                width: 36.h,
                // padding: EdgeInsets.all(8.h), // some inner padding for icon space
                alignment: Alignment.center,
                // child: AppbarLeadingImage(
                //   imagePath: ImageConstant.imgVector3,
                //   // fit: BoxFit.contain,
                // ),
                child: Icon(
                  Icons.chevron_left,
                  size: 24.h,
                  color: theme.colorScheme.primary, // or Colors.black or white
                ),
              ),
            ),
            SizedBox(width: 12.h),

            Expanded(
              child: Text(
                "Verification",
                textAlign: TextAlign.justify,
                style: CustomTextStyles.titleMediumOnPrimary.copyWith(
                    color: theme.colorScheme.primary,
                    fontSize: 26.fSize, // Responsive font size
                    fontWeight: FontWeight.w600),
              ),
            ),
            // const Spacer(flex: 2),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildTermsConditionsCheckbox(BuildContext context) {
    return CustomCheckboxButton(
      text: "Terms & Conditions", // Disabled for now
      // decoration: TextDecoration.underline,
      value: termsConditionsCheckbox, // Always true
      onChange: null, // Disabled - no interaction allowed
    );
  }

  Widget _buildSendOtpSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            text: "Send OTP",
            margin: EdgeInsets.only(bottom: 12.h),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  theme.colorScheme.primary, //setss bg color from the app theme
              foregroundColor:
                  Colors.white, //setss text color from the app theme
            ),
            // style: ElevatedButton.styleFrom(
            // backgroundColor: Colors.blue, // Set the button color to blue
            // foregroundColor: Colors.white, // Set the text color to white
            // padding: EdgeInsets.symmetric(vertical: 12.h),

            // ),
            onPressed: () {
              // sendOtp(
              //     context); //triggering the sentotp function on button press
              sendOtp2(context);
            },
          )
        ],
      ),
    );
  }

  //navigates to the androidsmallfourscreen when the action is trigerred

  onTapSendotp(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.androidSmallFourScreen,
      arguments: phoneNumberController.text,
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:nextgen_app/presentation/android_small_four_screen/android_small_four_screen.dart';
// import 'package:nextgen_app/presentation/android_small_two_screen/android_small_two_screen.dart';
// import '../../core/app_export.dart';
// import '../../theme/custom_button_style.dart';
// import '../../widgets/app_bar/appbar_leading_image.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_checkbox_button.dart';
// import '../../widgets/custom_text_form_field.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:uuid/uuid.dart'; // For UUID generation (not used here but can be added for additional features)
// import 'package:firebase_auth/firebase_auth.dart';

// class AndroidSmallThreeScreen extends StatefulWidget {
//   @override
//   _AndroidSmallThreeScreenState createState() =>
//       _AndroidSmallThreeScreenState();
// }

// class _AndroidSmallThreeScreenState extends State<AndroidSmallThreeScreen> {
//   TextEditingController phoneNumberController = TextEditingController();
//   bool termsConditionsCheckbox = true;
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     //retrieving  the phone number passed from the previous screen to get it autofilled here.
//     final String? phoneNumber =
//         ModalRoute.of(context)?.settings.arguments as String?;
//     if (phoneNumber != null && phoneNumber.isNotEmpty) {
//       phoneNumberController.text = phoneNumber;
//     }

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: _buildAppBar(context),
//         body: Form(
//           key: _formKey,
//           child: SizedBox(
//             width: double.maxFinite,
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Expanded(
//                   child: Container(
//                     width: double.maxFinite,
//                     padding: EdgeInsets.symmetric(horizontal: 22.h),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             "Verification",
//                             style: theme.textTheme.titleLarge,
//                           ),
//                         ),
//                         SizedBox(height: 32.h),
//                         CustomTextFormField(
//                           controller: phoneNumberController,
//                           hintText: "Enter your Phone number or Email ID",
//                           textInputAction: TextInputAction.done,
//                           textInputType: TextInputType.phone,
//                           contentPadding: EdgeInsets.symmetric(
//                             horizontal: 20.h,
//                             vertical: 16.h,
//                           ),
//                         ),
//                         SizedBox(height: 18.h),
//                         Text(
//                           "By logging in you accept",
//                           style: theme.textTheme.titleSmall,
//                         ),
//                         SizedBox(height: 6.h),
//                         _buildTermsConditionsCheckbox(context),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         bottomNavigationBar: _buildSendOtpSection(context),
//       ),
//     );
//   }

//   // AppBar widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       leadingWidth: 50.h, // Increase width for larger arrow space
//       leading: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AndroidSmallTwoScreen()),
//           ); // Navigate to the previous screen
//         },
//         child: Padding(
//           padding: EdgeInsets.only(left: 5.h, top: 10.h), // Align to top-left
//           child: SizedBox(
//             height: 30.h, // Set desired arrow size
//             width: 30.h,
//             child: AppbarLeadingImage(
//               imagePath: ImageConstant.imgVector3, // Path to back arrow asset
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Terms & Conditions Checkbox widget
//   Widget _buildTermsConditionsCheckbox(BuildContext context) {
//     return CustomCheckboxButton(
//       text: "Terms & Conditions",
//       value: termsConditionsCheckbox,
//       onChange: (value) {
//         setState(() {
//           termsConditionsCheckbox = value;
//         });
//       },
//     );
//   }

//   // OTP Send Button Section
//   Widget _buildSendOtpSection(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       padding: EdgeInsets.symmetric(horizontal: 22.h),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CustomElevatedButton(
//             text: "Send OTP",
//             margin: EdgeInsets.only(bottom: 12.h),
//             style: ElevatedButton.styleFrom(
//               backgroundColor:
//                   theme.colorScheme.primary, // Set button background color from app theme
//               foregroundColor: Colors.white, // Set text color from app theme
//             ),
//             onPressed: () {
//               sendOtpWithFirebase(context);
//             },
//           )
//         ],
//       ),
//     );
//   }

//   // Function to send OTP with Firebase
//   void sendOtpWithFirebase(BuildContext context) async {
//     final String phoneNumber = phoneNumberController.text.trim();

//     // Validate phone number input
//     if (phoneNumber.isEmpty || phoneNumber.length < 10) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter a valid phone number')),
//       );
//       return;
//     }

//     try {
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: "+91$phoneNumber", // Add your country code
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           // Auto verification (especially on Android)
//           await FirebaseAuth.instance.signInWithCredential(credential);
//           print("Auto-verified & signed in");

//           // Directly navigate to the next screen
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AndroidSmallFourScreen(phoneNumber: phoneNumber),
//             ),
//           );
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Verification failed: ${e.message}')),
//           );
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           print("Code sent. Verification ID: $verificationId");

//           // Navigate to OTP input screen (Screen 4)
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AndroidSmallFourScreen(
//                 phoneNumber: phoneNumber,
//                 verificationId: verificationId, // Pass this
//               ),
//             ),
//           );
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           print("Timeout: $verificationId");
//         },
//         timeout: const Duration(seconds: 60),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')),
//       );
//     }
//   }
// }
