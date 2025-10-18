// // import 'package:flutter/material.dart';
// // import '../../core/app_export.dart';
// // import '../../theme/custom_button_style.dart';
// // import '../../widgets/app_bar/appbar_leading_image.dart';
// // import '../../widgets/app_bar/custom_app_bar.dart';
// // import '../../widgets/custom_elevated_button.dart';
// // import '../../widgets/custom_pin_code_text_field.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import '../android_small_five_screen/android_small_five_screen.dart';
// // import '../android_small_six_screen/android_small_six_screen.dart';
// // import 'package:uuid/uuid.dart'; // Add this import for UUID

// // class AndroidSmallFourScreen extends StatefulWidget {
// //   final String phoneNumber;
// //   const AndroidSmallFourScreen({Key? key, required this.phoneNumber})
// //       : super(
// //           key: key,
// //         );

// //   @override
// //   State<AndroidSmallFourScreen> createState() => _AndroidSmallFourScreenState();
// // }

// // class _AndroidSmallFourScreenState extends State<AndroidSmallFourScreen> {
// //   final TextEditingController _otpController = TextEditingController();
// //   String sessionCookie = "";

// //   // void requestNewOtp() {
// //   //   //clear previous otp from the memory...
// //   //   _otpController.clear();
// //   //   print("previous otp cleared");

// //   //   //simulating fetching a new otp from the server...
// //   // }
// //    void requestNewOtp() async {
// //     // Clear previous OTP from the memory
// //     _otpController.clear();
// //     print("Previous OTP cleared");

// //     // Add a unique timestamp to the URL to prevent caching
// //     final timestamp = DateTime.now().millisecondsSinceEpoch;
// //     final url = Uri.parse('https://api.appment.in/api/send-otp?timestamp=$timestamp');

// //     Map<String, String> headers = {
// //       'X-DEVICE': 'ANDROID',
// //       'X-APP-VERSION': '5.0.0',
// //       'Accept': 'application/json',
// //       'Cache-Control': 'no-cache', // Prevent caching
// //     };

// //     var request = http.MultipartRequest('POST', url);
// //     request.headers.addAll(headers);
// //     request.fields.addAll({
// //       'phoneNumber': widget.phoneNumber,
// //     });

// //     try {
// //       var response = await request.send();
// //       if (response.statusCode == 200) {
// //         print("New OTP requested successfully");
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(
// //             content: Text("New OTP sent to ${widget.phoneNumber}"),
// //             backgroundColor: Colors.green,
// //           ),
// //         );
// //       } else {
// //         print("Failed to request new OTP: ${response.statusCode}");
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(
// //             content: Text("Failed to request new OTP"),
// //             backgroundColor: Colors.red,
// //           ),
// //         );
// //       }
// //     } catch (e) {
// //       print("Error requesting new OTP: $e");
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text("An error occurred: $e"),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   }

// //   //function to handle otp validation and api call
// //   Future<void> validateOTP(String phoneNumber, String otp) async {
// //     try {
// //       // String cookie1 = 'SESSION=f2cc8d5a-22a3-490e-9c6e-b2bbdfa21c4e';
// //       // String cookie2 = 'SESSION=83e9bcbc-c97b-483f-acbf-1899521a3c08';
// //       // String cookies_combined = '$cookie1; $cookie2';

// //       final url = Uri.parse(
// //           'https://api.appment.in/api/login?timestamp=${DateTime.now().millisecondsSinceEpoch}');
// //       Map<String, String> headers = {
// //         'X-DEVICE': 'ANDROID',
// //         'X-APP-VERSION': '5.0.0',
// //         'Accept': 'application/json',
// //         'Cache-Control':'no-cache',

// //         // 'User-Agent': 'PostmanRuntime/7.43.0',
// //         // 'Content-Type': 'multipart/form-data',
// //         // 'Postman-Token': '33f66a21-9a4b-419b-b0bd-4c699609d540',
// //         // 'Content-Type': 'multipart/form-data; boundary=--------------------------950830726707545918136828',
// //       };

// //       var request2 = http.MultipartRequest('POST', url);
// //       request2.headers.addAll(headers);
// //       request2.fields.addAll({
// //         'username': phoneNumber,
// //         'password': otp,
// //       });

// //       //preparing form data
// //       // final body = jsonEncode({
// //       //   'username': phoneNumber,
// //       //   'password': otp,
// //       // });

// //       // //making post request
// //       // final response2 = await http.post(
// //       //   url,
// //       //   headers: headers,
// //       //   body: body,
// //       // );

// //       var response2 = await request2.send();
// //       // Set<int> responseCode2 = {response2.statusCode};
// //       int responseCode2 = response2.statusCode;
// //       print("phoneNumber: ${widget.phoneNumber}");
// //       print("otp: ${_otpController.text}");
// //       print("Response Status Code: $responseCode2");
// //       print("Response api2 Headers: ${response2.headers}");
// //       print("request Body: ${request2.headers}");
// //       // print("Headers: $headers");
// //       print("request fields: ${request2.fields}");
// //       print("request url: ${request2.url}");
// //       print("response of 2nd api: ${response2.headers}");
// //       // print("Body: $body");

// //       if (responseCode2 == (302)) {
// //         //302 is the status code for redirection
// //         print("302 status code aaya hai ,uske andar hu...");
// //         String redirectUrl = response2.headers['location'] ?? '';
// //         if (redirectUrl.isNotEmpty) {
// //           print("redirecting to : $redirectUrl");

// // //extracting session cookies
// //           List<String> cookies =
// //               response2.headers['set-cookie']?.split(';') ?? [];

// //           String sessionCookie = cookies
// //               .firstWhere(
// //                 (cookie) => cookie.contains('SESSION='),
// //                 orElse: () => '',
// //               )
// //               .split('SESSION=')
// //               .last
// //               .split(';')
// //               .first;

// //           if (sessionCookie.isNotEmpty) {
// //             print("mili cookie: $sessionCookie");
// //             print(
// //                 "Sending Cookie in Redirected Request: ${response2.headers['set-cookie']}");
// //             //using it in redirected request
// //             Map<String, String> redirectHeaders = {
// //               'X-Device': 'ANDROID',
// //               'X-App-Version': '5.0.0',
// //               'Cookie': sessionCookie,
// //               'Content-Type': 'application/json',
// //             };

// //             //sending themew request to the redirected url
// //             var redirectedResponse = await http.get(
// //               Uri.parse(redirectUrl),
// //               headers: redirectHeaders,
// //             );
// //             print('Redirected Response ki body: ${redirectedResponse.body}');
// //             print(
// //                 'status code of redirected response: ${redirectedResponse.statusCode}');
// //             if (redirectedResponse.statusCode == 401) {
// //               print("succesfully redirected!");
// //             } else {
// //               print("failed redirection");
// //             }
// //             //checking if the response body is empty or not
// //             String redirectResponsebody = redirectedResponse.body;
// //             if (redirectResponsebody.isEmpty) {
// //               print("yaar yeh redirected response ki body kahli hai!");
// //             } else {
// //               // requestNewOtp();
// //               print(
// //                   "mili bhai redirected response body: $redirectResponsebody");

// //               final responseData = jsonDecode(redirectResponsebody);
// //               print("aab chaek karugi firstname vagera...");
// //               print("First Name: ${responseData['firstName']}");
// //               if (responseData['firstName'] != null &&
// //                   responseData['firstName'].toString().trim().isNotEmpty) {
// //                 print(
// //                     "if mai hu...user check ke... matlab user exist kar raha hai...");
// //                 //it means, user is existing already.
// //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                   content: Text("Welcome Back, ${responseData['firstName']}!"),
// //                   backgroundColor: Colors.lightBlue,
// //                 ));

// //                 //navigating to doctor chat screen after successful login
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                         builder: (context) => AndroidSmallSixScreen()));
// //               } else if ((responseData['firstName'] == null) ||
// //                   (responseData['firstName' == ""])) {
// //                 print("else if mai hu user check ke...");
// //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                   content: Text("Welcome, Please Complete your Profile!"),
// //                   backgroundColor: Colors.blue,
// //                 ));
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                       builder: (context) => AndroidSmallFiveScreen()),
// //                 );
// //               } else {
// //                 //it means, user is new. and firstname, lastname all details will be null
// //                 // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                 //   content: Text("Welcome, Please Complete your Profile!"),
// //                 //   backgroundColor: Colors.blue,
// //                 // ));
// //                 // Navigator.push(
// //                 //   context,
// //                 //   MaterialPageRoute(
// //                 //       builder: (context) => AndroidSmallFiveScreen()),
// //                 // );
// //                 print("ruko...");
// //               }
// //             }
// //           } else {
// //             print("session cookie not found");
// //           }
// //         } else {
// //           print("redirected url hee khali hai...");
// //         }
// //       } else {
// //         print("302 return nahi kar raha hai!!");
// //         //handling error response from API
// //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //           content: Text("Failed to Validate OTP, Please Try Again!"),
// //           backgroundColor: Colors.red,
// //         ));
// //       }

// //       //handling the redirection

// //       // You might need to send the session cookie here for the next request
// //       // Extract the cookie from response headers
// //       // String? sessionCookie = response2.headers['set-cookie'];
// //       //parsing response
// //     } catch (e) {
// //       //handling any exceptions that occurred during the API call
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text("An error occurred: $e"),
// //         backgroundColor: Colors.red,
// //       ));
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         resizeToAvoidBottomInset: false,
// //         appBar: _buildAppBar(context),
// //         body: SizedBox(
// //           width: double.maxFinite,
// //           child: Column(
// //             mainAxisSize: MainAxisSize.max,
// //             children: [
// //               Expanded(
// //                 child: Container(
// //                   width: double.maxFinite,
// //                   padding: EdgeInsets.symmetric(horizontal: 14.h),
// //                   child: Column(
// //                     mainAxisSize: MainAxisSize.max,
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Align(
// //                         alignment: Alignment.center,
// //                         child: Text(
// //                           "Enter OTP",
// //                           style: theme.textTheme.titleLarge,
// //                         ),
// //                       ),
// //                       SizedBox(height: 30.h),
// //                       SizedBox(
// //                         width: double.maxFinite,
// //                         child: CustomPinCodeTextField(
// //                           controller:
// //                               _otpController, //to take the otp froom the scree nthat was entered by the user...
// //                           context: context,
// //                           onChanged: (value) {},
// //                         ),
// //                       ),
// //                       SizedBox(height: 14.h),
// //                       Padding(
// //                         padding: EdgeInsets.only(left: 6.h),
// //                         child: RichText(
// //                           text: TextSpan(
// //                             children: [
// //                               TextSpan(
// //                                 text: "Didn't receive the OTP? ",
// //                                 style: CustomTextStyles.titleSmallGray500,
// //                               ),
// //                               TextSpan(
// //                                 text: " ",
// //                               ),
// //                               TextSpan(
// //                                 text: "Resend ",
// //                                 style: CustomTextStyles
// //                                     .titleSmallErrorContainer_1
// //                                     .copyWith(
// //                                   decoration: TextDecoration.underline,
// //                                 ),
// //                               )
// //                             ],
// //                           ),
// //                           textAlign: TextAlign.left,
// //                         ),
// //                       ),
// //                       SizedBox(height: 6.h),
// //                       // Padding(
// //                       //   padding: EdgeInsets.only(left: 6.h),
// //                       //   child: Text(
// //                       //     "Get OTP on call",
// //                       //     style: theme.textTheme.titleSmall!.copyWith(
// //                       //       decoration: TextDecoration.underline,
// //                       //     ),
// //                       //   ),
// //                       // )
// //                     ],
// //                   ),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //         bottomNavigationBar: _buildLoginSection(context),
// //       ),
// //     );
// //   }

// //   PreferredSizeWidget _buildAppBar(BuildContext context) {
// //     return CustomAppBar(
// //       leadingWidth: 31.h,
// //       leading: GestureDetector(
// //         onTap: () {
// //           Navigator.pop(context); //navigates to previous screen.
// //         },
// //         child: AppbarLeadingImage(
// //           imagePath: ImageConstant.imgVector3,
// //           margin: EdgeInsets.only(left: 23.h),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildLoginSection(BuildContext context) {
// //     return Container(
// //       width: double.maxFinite,
// //       padding: EdgeInsets.symmetric(horizontal: 22.h),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           CustomElevatedButton(
// //             //ok,so the style for customelevatedbutton is the buttonStyle only.
// //             text: " In",
// //             margin: EdgeInsets.only(bottom: 12.h),
// //             // buttonStyle: CustomButtonStyles.none,
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor:
// //                   theme.colorScheme.primary, //setss bg color from the app theme
// //               foregroundColor:
// //                   Colors.white, //setss text color from the app theme
// //             ),
// //             // style: ElevatedButton.styleFrom(
// //             //   backgroundColor: Colors.blue, // Set the button color to blue
// //             //   foregroundColor: Colors.white, // Set the text color to white
// //             //   padding: EdgeInsets.symmetric(vertical: 12.h),
// //             //   ),
// //             onPressed: () {
// //               //getting otp from the controller and phone number from previous screen
// //               String otp = _otpController.text;
// //               print("otp in login button: $otp");
// //               String phoneNumber = widget.phoneNumber;
// //               print("phoneNumber in login button: $phoneNumber");
// //               if (otp.isNotEmpty && phoneNumber.isNotEmpty) {
// //                 validateOTP(phoneNumber, otp);
// //                 requestNewOtp();
// //               } else {
// //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                   content: Text("Please enter OTP "),
// //                   backgroundColor: Colors.red,
// //                 ));
// //               }
// //             },
// //           )
// //         ],
// //       ),
// //     );
// //   }

// // //navigatess to androidsmallfivescreen wwhen the action is triggered.
// // // _onTapLogin(BuildContext context){
// // //   Navigator.pushNamed(context, AppRoutes.androidSmallFiveScreen);
// // // }
// // //
// // }
// // // import 'package:flutter/material.dart';
// // // import '../../core/app_export.dart';
// // // import '../../theme/custom_button_style.dart';
// // // import '../../widgets/app_bar/appbar_leading_image.dart';
// // // import '../../widgets/app_bar/custom_app_bar.dart';
// // // import '../../widgets/custom_elevated_button.dart';
// // // import '../../widgets/custom_pin_code_text_field.dart';
// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // // import '../android_small_five_screen/android_small_five_screen.dart';
// // // import '../android_small_six_screen/android_small_six_screen.dart';

// // // class AndroidSmallFourScreen extends StatefulWidget {
// // //   final String phoneNumber;
// // //   const AndroidSmallFourScreen({Key? key, required this.phoneNumber})
// // //       : super(key: key);

// // //   @override
// // //   State<AndroidSmallFourScreen> createState() => _AndroidSmallFourScreenState();
// // // }

// // // class _AndroidSmallFourScreenState extends State<AndroidSmallFourScreen> {
// // //   final TextEditingController _otpController = TextEditingController();
// // //   String sessionCookie = "";

// // //   void requestNewOtp() async {
// // //     // Clear previous OTP from the memory
// // //     _otpController.clear();
// // //     print("Previous OTP cleared");

// // //     // Add a unique timestamp to the URL to prevent caching
// // //     final timestamp = DateTime.now().millisecondsSinceEpoch;
// // //     final url = Uri.parse('https://api.appment.in/api/send-otp?timestamp=$timestamp');

// // //     Map<String, String> headers = {
// // //       'X-DEVICE': 'ANDROID',
// // //       'X-APP-VERSION': '5.0.0',
// // //       'Accept': 'application/json',
// // //       'Cache-Control': 'no-cache', // Prevent caching
// // //     };

// // //     var request = http.MultipartRequest('POST', url);
// // //     request.headers.addAll(headers);
// // //     request.fields.addAll({
// // //       'phoneNumber': widget.phoneNumber,
// // //     });

// // //     try {
// // //       var response = await request.send();
// // //       if (response.statusCode == 200) {
// // //         print("New OTP requested successfully");
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           SnackBar(
// // //             content: Text("New OTP sent to ${widget.phoneNumber}"),
// // //             backgroundColor: Colors.green,
// // //           ),
// // //         );
// // //       } else {
// // //         print("Failed to request new OTP: ${response.statusCode}");
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           SnackBar(
// // //             content: Text("Failed to request new OTP"),
// // //             backgroundColor: Colors.red,
// // //           ),
// // //         );
// // //       }
// // //     } catch (e) {
// // //       print("Error requesting new OTP: $e");
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text("An error occurred: $e"),
// // //           backgroundColor: Colors.red,
// // //         ),
// // //       );
// // //     }
// // //   }

// // //   Future<void> validateOTP(String phoneNumber, String otp) async {
// // //     try {
// // //       final timestamp = DateTime.now().millisecondsSinceEpoch;
// // //       final url = Uri.parse('https://api.appment.in/api/login?timestamp=$timestamp');

// // //       Map<String, String> headers = {
// // //         'X-DEVICE': 'ANDROID',
// // //         'X-APP-VERSION': '5.0.0',
// // //         'Accept': 'application/json',
// // //         'Cache-Control': 'no-cache', // Prevent caching
// // //       };

// // //       var request = http.MultipartRequest('POST', url);
// // //       request.headers.addAll(headers);
// // //       request.fields.addAll({
// // //         'username': phoneNumber,
// // //         'password': otp,
// // //       });

// // //       var response = await request.send();
// // //       int responseCode = response.statusCode;
// // //       print("PhoneNumber: ${widget.phoneNumber}");
// // //       print("OTP: ${_otpController.text}");
// // //       print("Response Status Code: $responseCode");
// // //       print("Response Headers: ${response.headers}");
// // //       print("Request Fields: ${request.fields}");
// // //       print("Request URL: ${request.url}");

// // //       if (responseCode == 302) {
// // //         // Handle redirection logic here
// // //         String redirectUrl = response.headers['location'] ?? '';
// // //         if (redirectUrl.isNotEmpty) {
// // //           print("Redirecting to: $redirectUrl");

// // //           List<String> cookies = response.headers['set-cookie']?.split(';') ?? [];
// // //           String sessionCookie = cookies
// // //               .firstWhere(
// // //                 (cookie) => cookie.contains('SESSION='),
// // //                 orElse: () => '',
// // //               )
// // //               .split('SESSION=')
// // //               .last
// // //               .split(';')
// // //               .first;

// // //           if (sessionCookie.isNotEmpty) {
// // //             print("Session Cookie: $sessionCookie");

// // //             Map<String, String> redirectHeaders = {
// // //               'X-Device': 'ANDROID',
// // //               'X-App-Version': '5.0.0',
// // //               'Cookie': sessionCookie,
// // //               'Content-Type': 'application/json',
// // //             };

// // //             var redirectedResponse = await http.get(
// // //               Uri.parse(redirectUrl),
// // //               headers: redirectHeaders,
// // //             );
// // //             print('Redirected Response Body: ${redirectedResponse.body}');
// // //             print('Redirected Status Code: ${redirectedResponse.statusCode}');

// // //             if (redirectedResponse.statusCode == 200) {
// // //               final responseData = jsonDecode(redirectedResponse.body);
// // //               if (responseData['firstName'] != null && responseData['firstName'].toString().trim().isNotEmpty) {
// // //                 ScaffoldMessenger.of(context).showSnackBar(
// // //                   SnackBar(
// // //                     content: Text("Welcome Back, ${responseData['firstName']}!"),
// // //                     backgroundColor: Colors.lightBlue,
// // //                   ),
// // //                 );
// // //                 Navigator.push(
// // //                   context,
// // //                   MaterialPageRoute(
// // //                     builder: (context) => AndroidSmallSixScreen(),
// // //                   ),
// // //                 );
// // //               } else {
// // //                 ScaffoldMessenger.of(context).showSnackBar(
// // //                   SnackBar(
// // //                     content: Text("Welcome, Please Complete your Profile!"),
// // //                     backgroundColor: Colors.blue,
// // //                   ),
// // //                 );
// // //                 Navigator.push(
// // //                   context,
// // //                   MaterialPageRoute(
// // //                     builder: (context) => AndroidSmallFiveScreen(),
// // //                   ),
// // //                 );
// // //               }
// // //             } else {
// // //               print("Failed to handle redirection");
// // //             }
// // //           } else {
// // //             print("Session cookie not found");
// // //           }
// // //         } else {
// // //           print("Redirect URL is empty");
// // //         }
// // //       } else {
// // //         print("Unexpected status code: $responseCode");
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           SnackBar(
// // //             content: Text("Failed to Validate OTP, Please Try Again!"),
// // //             backgroundColor: Colors.red,
// // //           ),
// // //         );
// // //       }
// // //     } catch (e) {
// // //       print("Error validating OTP: $e");
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text("An error occurred: $e"),
// // //           backgroundColor: Colors.red,
// // //         ),
// // //       );
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SafeArea(
// // //       child: Scaffold(
// // //         resizeToAvoidBottomInset: false,
// // //         appBar: _buildAppBar(context),
// // //         body: SizedBox(
// // //           width: double.maxFinite,
// // //           child: Column(
// // //             mainAxisSize: MainAxisSize.max,
// // //             children: [
// // //               Expanded(
// // //                 child: Container(
// // //                   width: double.maxFinite,
// // //                   padding: EdgeInsets.symmetric(horizontal: 14.h),
// // //                   child: Column(
// // //                     mainAxisSize: MainAxisSize.max,
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Align(
// // //                         alignment: Alignment.center,
// // //                         child: Text(
// // //                           "Enter OTP",
// // //                           style: theme.textTheme.titleLarge,
// // //                         ),
// // //                       ),
// // //                       SizedBox(height: 30.h),
// // //                       SizedBox(
// // //                         width: double.maxFinite,
// // //                         child: CustomPinCodeTextField(
// // //                           controller: _otpController,
// // //                           context: context,
// // //                           onChanged: (value) {},
// // //                         ),
// // //                       ),
// // //                       SizedBox(height: 14.h),
// // //                       Padding(
// // //                         padding: EdgeInsets.only(left: 6.h),
// // //                         child: GestureDetector(
// // //                           onTap: () {
// // //                             // Call the requestNewOtp function when "Resend" is tapped
// // //                             requestNewOtp();
// // //                           },
// // //                           child: RichText(
// // //                             text: TextSpan(
// // //                               children: [
// // //                                 TextSpan(
// // //                                   text: "Didn't receive the OTP?! ",
// // //                                   style: CustomTextStyles.titleSmallGray500,
// // //                                 ),
// // //                                 TextSpan(
// // //                                   text: "Resend",
// // //                                   style: CustomTextStyles.titleSmallErrorContainer_1.copyWith(
// // //                                     decoration: TextDecoration.underline,
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                             textAlign: TextAlign.left,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //         bottomNavigationBar: _buildLoginSection(context),
// // //       ),
// // //     );
// // //   }

// // //   PreferredSizeWidget _buildAppBar(BuildContext context) {
// // //     return CustomAppBar(
// // //       leadingWidth: 31.h,
// // //       leading: GestureDetector(
// // //         onTap: () {
// // //           Navigator.pop(context);
// // //         },
// // //         child: AppbarLeadingImage(
// // //           imagePath: ImageConstant.imgVector3,
// // //           margin: EdgeInsets.only(left: 23.h),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildLoginSection(BuildContext context) {
// // //     return Container(
// // //       width: double.maxFinite,
// // //       padding: EdgeInsets.symmetric(horizontal: 22.h),
// // //       child: Column(
// // //         mainAxisSize: MainAxisSize.min,
// // //         children: [
// // //           CustomElevatedButton(
// // //             text: "Log In",
// // //             margin: EdgeInsets.only(bottom: 12.h),
// // //             style: ElevatedButton.styleFrom(
// // //               backgroundColor: theme.colorScheme.primary,
// // //               foregroundColor: Colors.white,
// // //             ),
// // //             onPressed: () {
// // //               String otp = _otpController.text;
// // //               String phoneNumber = widget.phoneNumber;
// // //               if (otp.isNotEmpty && phoneNumber.isNotEmpty) {
// // //                 validateOTP(phoneNumber, otp);
// // //               } else {
// // //                 ScaffoldMessenger.of(context).showSnackBar(
// // //                   SnackBar(
// // //                     content: Text("Please enter OTP"),
// // //                     backgroundColor: Colors.red,
// // //                   ),
// // //                 );
// // //               }
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uuid/uuid.dart'; // Add this import for UUID
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_pin_code_text_field.dart';
import 'package:http/http.dart' as http;
import '../android_small_five_screen/android_small_five_screen.dart';
import '../android_small_six_screen/android_small_six_screen.dart';
import 'dart:async';

class AndroidSmallFourScreen extends StatefulWidget {
  final String phoneNumber;
  const AndroidSmallFourScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<AndroidSmallFourScreen> createState() => _AndroidSmallFourScreenState();
}

class _AndroidSmallFourScreenState extends State<AndroidSmallFourScreen> {
  bool _isloading = false;
  final TextEditingController _otpController = TextEditingController();
  String sessionCookie = "";
  bool _isResendDisabled = false; // To prevent spamming the resend button
  int _remainingTime = 30;
  Timer? _timer;
  int _resendAttempts = 0; // Track number of resend attempts
  static const int _maxResendAttempts = 3; // Maximum allowed resend attempts
  int? patientId; // Patient ID from login response

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    // Cancel any existing timer first
    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _isResendDisabled = false;
          timer.cancel();
        }
      });
    });
  }
  // Function to request a new OTP
  // void requestNewOtp() async {
  //   if (_isResendDisabled) return; // Prevent multiple requests

  //   setState(() {
  //     _isResendDisabled = true; // Disable the resend button
  //   });

  //   _otpController.clear();
  //   print("Previous OTP cleared");

  //   final uuid = Uuid().v4(); // Generate a unique UUID
  //   final timestamp = DateTime.now().millisecondsSinceEpoch;
  //   final url = Uri.parse(
  //       'https://api.appment.in/api/send-otp?timestamp=$timestamp&nonce=$uuid');

  //   Map<String, String> headers = {
  //     'X-DEVICE': 'ANDROID',
  //     'X-APP-VERSION': '5.0.0',
  //     'Accept': 'application/json',
  //     'Cache-Control': 'no-cache, no-store', // Prevent caching
  //   };

  //   var request = http.MultipartRequest('POST', url);
  //   request.headers.addAll(headers);
  //   request.fields.addAll({
  //     'phoneNumber': widget.phoneNumber,
  //   });

  //   try {
  //     var response = await request.send();
  //     if (response.statusCode == 200) {
  //       print("New OTP requested successfully");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("New OTP sent to ${widget.phoneNumber}"),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //     } else {
  //       print("Failed to request new OTP: ${response.statusCode}");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("Failed to request new OTP"),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print("Error requesting new OTP: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("An error occurred: $e"),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   } finally {
  //     // Re-enable the resend button after 30 seconds
  //     Future.delayed(Duration(seconds: 30), () {
  //       setState(() {
  //         _isResendDisabled = false;
  //       });
  //     });
  //   }
  // }
  void requestNewOtp() async {
    if (_isResendDisabled) return; // Prevent multiple requests

    // Check if maximum resend attempts reached
    if (_resendAttempts >= _maxResendAttempts) {
      print("Max attempts reached: $_resendAttempts >= $_maxResendAttempts");

      // Show SnackBar as immediate feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Maximum OTP resend attempts reached. Please contact clinic."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );

      // Also show dialog
      _showMaxAttemptsReachedDialog();
      return;
    }

    // Debug: Show current attempt count
    print("Resend attempt: ${_resendAttempts + 1}/$_maxResendAttempts");

    setState(() {
      _isResendDisabled = true; // Disable the resend button
      _remainingTime = 30;
      _resendAttempts++; // Increment resend attempts
    });
    startTimer();
    _otpController.clear();
    print("Previous OTP cleared");

    // Construct the URL without timestamp and nonce
    final url = Uri.parse(
        'https://api.appment.in/api/patient/user/otp/${widget.phoneNumber}');

    // Headers as per Postman
    Map<String, String> headers = {
      'X-Device': 'ANDROID',
      'X-App-Version': '5.0.0',
    };

    // Log the full request
    print("Request URL: ${url}");
    print("Request Headers: ${headers}");

    try {
      // Send a POST request with an empty body
      var response = await http.post(
        url,
        headers: headers,
        body: '', // Empty body as per Postman
      );

      int statusCode = response.statusCode;
      print("Response Status Code: $statusCode");
      print("Response Headers: ${response.headers}");
      print("Response Body: ${response.body}");

      if (statusCode == 200 || statusCode == 204) {
        print("New OTP requested successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("New OTP sent to +91${widget.phoneNumber}"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print("Failed to request new OTP: $statusCode");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to request new OTP"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print("Error requesting new OTP: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred: $e"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      // Re-enable the resend button after 30 seconds
      Future.delayed(Duration(seconds: 30), () {
        setState(() {
          _isResendDisabled = false;
        });
      });
    }
  }

  // Send test notification after successful login
  Future<void> _sendTestNotification(String firstName) async {
    try {
      // Get FCM token
      String? token = await FirebaseMessaging.instance.getToken();

      if (token != null) {
        print('FCM Token for backend: $token');

        // Send FCM token to your backend
        await _sendFCMTokenToBackend(token);

        // Show test notification
        print(
            '🎉 Test notification would be sent: "Welcome $firstName! You are now logged in successfully."');

        // Show a local notification-style message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.notifications_active, color: Colors.white),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "🎉 Welcome $firstName! Login successful. Push notifications are working!",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            backgroundColor: Color(0xFF1976D2), // Blue theme
            duration: Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      } else {
        print('FCM token not available for test notification');
      }
    } catch (e) {
      print('Error sending test notification: $e');
    }
  }

  // Send FCM token to your backend API
  Future<void> _sendFCMTokenToBackend(String fcmToken) async {
    try {
      // Get current patient ID from the login response
      if (patientId != null) {
        print('Sending FCM token to backend for patientId: $patientId');

        // Prepare the request
        final url = Uri.parse('https://api.appment.in/api/fcm-token');
        final headers = {
          'Content-Type': 'application/json',
          'X-DEVICE': 'ANDROID',
          'X-APP-VERSION': '5.0.0',
        };

        final body = {
          'patientId': patientId,
          'fcmToken': fcmToken,
          'platform': 'android',
          'deviceId': 'device_${DateTime.now().millisecondsSinceEpoch}',
        };

        print('FCM Token API Request: $body');

        final response = await http.post(
          url,
          headers: headers,
          body: jsonEncode(body),
        );

        print('FCM Token API Response Status: ${response.statusCode}');
        print('FCM Token API Response Body: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          print('✅ FCM token successfully sent to backend');
        } else {
          print(
              '❌ Failed to send FCM token to backend: ${response.statusCode}');
        }
      } else {
        print('❌ Patient ID not available, cannot send FCM token to backend');
      }
    } catch (e) {
      print('❌ Error sending FCM token to backend: $e');
    }
  }

  // Show dialog when maximum resend attempts are reached
  void _showMaxAttemptsReachedDialog() {
    print("Showing max attempts dialog - attempts: $_resendAttempts");

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("⚠️ Maximum Attempts Reached"),
          content: Text(
            "You have reached the maximum number of OTP resend attempts (3).\n\nPlease contact the clinic for assistance.",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate back to previous screen
                Navigator.of(context).pop();
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  // Function to validate OTP
  // Future<void> validateOTP(String phoneNumber, String otp) async {
  //   try {
  //     final uuid = Uuid().v4(); // Generate a unique UUID
  //     final url = Uri.parse(
  //         'https://api.appment.in/api/login?timestamp=${DateTime.now().millisecondsSinceEpoch}&nonce=$uuid');

  //     Map<String, String> headers = {
  //       'X-DEVICE': 'ANDROID',
  //       'X-APP-VERSION': '5.0.0',
  //       'Accept': 'application/json',
  //       'Cache-Control': 'no-cache, no-store', // Prevent caching
  //     };

  //     var request = http.MultipartRequest('POST', url);
  //     request.headers.addAll(headers);
  //     request.fields.addAll({
  //       'username': phoneNumber,
  //       'password': otp,
  //     });

  //     var response = await request.send();
  //     int responseCode = response.statusCode;
  //     print("PhoneNumber: ${widget.phoneNumber}");
  //     print("OTP: ${_otpController.text}");
  //     print("Response Status Code: $responseCode");
  //     print("Response Headers: ${response.headers}");
  //     print("Request Fields: ${request.fields}");
  //     print("Request URL: ${request.url}");

  //     if (responseCode == 302) {
  //       String redirectUrl = response.headers['location'] ?? '';
  //       if (redirectUrl.isNotEmpty) {
  //         print("Redirecting to: $redirectUrl");

  //         List<String> cookies = response.headers['set-cookie']?.split(';') ?? [];
  //         String sessionCookie = cookies
  //             .firstWhere(
  //               (cookie) => cookie.contains('SESSION='),
  //               orElse: () => '',
  //             )
  //             .split('SESSION=')
  //             .last
  //             .split(';')
  //             .first;

  //         if (sessionCookie.isNotEmpty) {
  //           print("Session Cookie: $sessionCookie");

  //           Map<String, String> redirectHeaders = {
  //             'X-Device': 'ANDROID',
  //             'X-App-Version': '5.0.0',
  //             'Cookie': sessionCookie,
  //             'Content-Type': 'application/json',
  //           };

  //           var redirectedResponse = await http.get(
  //             Uri.parse(redirectUrl),
  //             headers: redirectHeaders,
  //           );
  //           print('Redirected Response Body: ${redirectedResponse.body}');
  //           print('Redirected Status Code: ${redirectedResponse.statusCode}');

  //           if (redirectedResponse.statusCode == 200) {
  //             final responseData = jsonDecode(redirectedResponse.body);
  //             if (responseData['firstName'] != null &&
  //                 responseData['firstName'].toString().trim().isNotEmpty) {
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(
  //                   content: Text("Welcome Back, ${responseData['firstName']}!"),
  //                   backgroundColor: Colors.lightBlue,
  //                 ),
  //               );
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => AndroidSmallSixScreen()),
  //               );
  //             } else {
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(
  //                   content: Text("Welcome, Please Complete your Profile!"),
  //                   backgroundColor: Colors.blue,
  //                 ),
  //               );
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => AndroidSmallFiveScreen()),
  //               );
  //             }
  //           } else {
  //             print("Failed to handle redirection");
  //           }
  //         } else {
  //           print("Session cookie not found");
  //         }
  //       } else {
  //         print("Redirect URL is empty");
  //       }
  //     } else {
  //       print("Unexpected status code: $responseCode");
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text("Failed to Validate OTP, Please Try Again!"),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print("Error validating OTP: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("An error occurred: $e"),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }
  Future<void> validateOTP(String phoneNumber, String otp) async {
    try {
      setState(() {
        _isloading = true;
      });
      final url = Uri.parse('https://api.appment.in/api/login');

      // Headers as per Postman
      Map<String, String> headers = {
        'X-DEVICE': 'ANDROID',
        'X-APP-VERSION': '5.0.0',
      };

      // Create a multipart request
      var request = http.MultipartRequest('POST', url);
      request.headers.addAll(headers);

      // Add form-data fields
      request.fields['username'] = phoneNumber;
      request.fields['password'] = otp;

      // Log the full request
      print("Request URL: ${request.url}");
      print("Request Headers: ${request.headers}");
      print("Request Fields: ${request.fields}");

      // Send the request
      var response = await request.send();
      int statusCode = response.statusCode;
      print("Response Status Code: $statusCode");
      print("Response Headers: ${response.headers}");

      // Read the response body
      var responseBody = await response.stream.bytesToString();
      print("Response Body: $responseBody");
      int patientId;
      if (statusCode == 200 || statusCode == 302) {
        // Handle successful response
        if (statusCode == 302) {
          // Handle redirection
          String redirectUrl = response.headers['location'] ?? '';
          if (redirectUrl.isNotEmpty) {
            print("Redirecting to: $redirectUrl");

            // Extract session cookie
            List<String> cookies =
                response.headers['set-cookie']?.split(';') ?? [];
            String sessionCookie = cookies
                .firstWhere(
                  (cookie) => cookie.contains('SESSION='),
                  orElse: () => '',
                )
                .split('SESSION=')
                .last
                .split(';')
                .first;

            if (sessionCookie.isNotEmpty) {
              print("Session Cookie: $sessionCookie");

              // Send a request to the redirected URL with the session cookie
              Map<String, String> redirectHeaders = {
                'X-Device': 'ANDROID',
                'X-App-Version': '5.0.0',
                'Cookie': 'SESSION=$sessionCookie',
                'Content-Type': 'application/json',
              };

              var redirectedResponse = await http.get(
                Uri.parse(redirectUrl),
                headers: redirectHeaders,
              );
              print('Redirected Response Body: ${redirectedResponse.body}');
              print('Redirected Status Code: ${redirectedResponse.statusCode}');

              if (redirectedResponse.statusCode == 200) {
                final responseData = jsonDecode(redirectedResponse.body);
                if (responseData['firstName'] != null &&
                    responseData['firstName'].toString().trim().isNotEmpty) {
                  //get the id of the user.
                  patientId = responseData['id'];
                  print("patientid: $patientId");
                  // Existing user
                  // console.log("inside when redirection successful and user exists already.");

                  //api vagera ke, rukne wale kaam ho gaye...
                  setState(() {
                    _isloading = false;
                  });

                  // Send test notification for successful login
                  await _sendTestNotification(responseData['firstName']);

                  // Welcome snackbar removed for better UX
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AndroidSmallSixScreen(patientId: patientId)),
                  );
                } else {
                  // New user
                  // Send test notification for new user registration
                  await _sendTestNotification("New User");

                  // Welcome snackbar removed for better UX
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AndroidSmallFiveScreen()),
                  );
                }
              } else {
                print("Failed to handle redirection");
              }
            } else {
              print("Session cookie not found");
            }
          } else {
            print("Redirect URL is empty");
          }
        } else {
          // Handle 200 response
          final responseData = jsonDecode(responseBody);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login successful!"),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        // Handle error response
        print("Failed to validate OTP: $statusCode");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to validate OTP, Please Try Again!"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isloading = false;
      });
      print("Error validating OTP: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: 14.h),
                      child: Column(
                        // mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment:
                            CrossAxisAlignment.center, //start tha
                        children: [
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Text(
                          //     "Enter OTP",
                          //     style: theme.textTheme.titleLarge,
                          //   ),
                          // ),
                          SizedBox(height: 30.h),

                          Text(
                            "Enter the 6-digit code sent to your phone",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 24.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: CustomPinCodeTextField(
                              controller: _otpController,
                              // keyboardType: TextInputType.phone,
                              context: context,
                              onChanged: (value) {},
                            ),
                          ),

                          // or can use direct logic now,
                          // SizedBox(
                          //   width: double.maxFinite,
                          //   child: CustomPinCodeTextField(
                          //     controller: _otpController,
                          //     keyboardType: TextInputType.phone,
                          //     context: context,
                          //     onChanged: (value) {},
                          //   ),
                          // ),
                          SizedBox(height: 14.h),

                          Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: GestureDetector(
                              onTap: _isResendDisabled
                                  ? null
                                  : _resendAttempts >= _maxResendAttempts
                                      ? () {
                                          // Show dialog when max attempts reached
                                          _showMaxAttemptsReachedDialog();
                                        }
                                      : () {
                                          requestNewOtp();
                                        },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Didn't receive the OTP? ",
                                      style: CustomTextStyles.titleSmallGray500,
                                    ),
                                    TextSpan(
                                      text:
                                          _resendAttempts >= _maxResendAttempts
                                              ? "Contact Clinic"
                                              : "Resend",
                                      style: CustomTextStyles
                                          .titleSmallErrorContainer_1
                                          .copyWith(
                                        decoration: TextDecoration.underline,
                                        color: _resendAttempts >=
                                                _maxResendAttempts
                                            ? Colors.grey
                                            : null,
                                      ),
                                    ),
                                    TextSpan(
                                      text: _isResendDisabled
                                          ? "($_remainingTime)"
                                          : _resendAttempts > 0 &&
                                                  _resendAttempts <
                                                      _maxResendAttempts
                                              ? " (${_maxResendAttempts - _resendAttempts} attempts left)"
                                              : "",
                                      style: CustomTextStyles
                                          .titleSmallErrorContainer,
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: _buildLoginSection(context),

            //try
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: _buildLoginSection(context),
            ),
          ),
          if (_isloading)
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
                    // Text(
                    //   "Verifying OTP...",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 16.fSize,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return AppBar(
  //     leadingWidth: 31.h,
  //     leading: GestureDetector(
  //       onTap: () {
  //         Navigator.pop(context);
  //       },
  //       child: AppbarLeadingImage(
  //         imagePath: ImageConstant.imgVector3,
  //         margin: EdgeInsets.only(left: 23.h),
  //       ),
  //     ),
  //   );
  // }

//the real one now.
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 74.h,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(left: 10.h, top: 40.h, right: 20.h),
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(30.h),
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 36.h,
                width: 36.h,
                alignment: Alignment.center,
                child: Icon(
                  Icons.chevron_left,
                  size: 24.h,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            SizedBox(
              width: 12.h,
            ),
            Expanded(
              child: Text(
                "OTP",
                textAlign: TextAlign.justify,
                style: CustomTextStyles.titleMediumOnPrimary.copyWith(
                  color: theme.colorScheme.primary,
                  fontSize: 26.fSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//   return AppBar(
//     leading: IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     ),
//     title: Text("Enter OTP"), // Optional: Set title here or in body
//     centerTitle: true,
//   );
// }
  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return AppBar(
  //     backgroundColor: Colors.white,
  //     elevation: 2,
  //     leading: IconButton(
  //       icon: const Icon(Icons.arrow_back, color: Colors.black),
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //     ),
  //     title: const Text(
  //       "Verify OTP",
  //       style: TextStyle(
  //         color: Colors.black,
  //         fontWeight: FontWeight.w600,
  //         fontSize: 18,
  //       ),
  //     ),
  //     centerTitle: true,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(
  //         bottom: Radius.circular(16),
  //       ),
  //     ),
  //   );
  // }

// PreferredSizeWidget _buildAppBar(BuildContext context) {
//   return AppBar(
//     title: const Text("Verify OTP"),
//     centerTitle: true,
//     elevation: 0,
//     backgroundColor: Colors.white,
//     foregroundColor: Colors.black,
//     leading: IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () => Navigator.pop(context),
//     ),
//   );
// }

  Widget _buildLoginSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            text: "Log In",
            margin: EdgeInsets.only(bottom: 12.h),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              String otp = _otpController.text;
              String phoneNumber = widget.phoneNumber;
              if (otp.isNotEmpty && phoneNumber.isNotEmpty) {
                validateOTP(phoneNumber, otp);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please enter OTP"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
// screen4_auth.dart

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../android_small_five_screen/android_small_five_screen.dart';
// import '../android_small_six_screen/android_small_six_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AndroidSmallFourScreen extends StatefulWidget {
//   final String phoneNumber;
//   final String? verificationId;
//   const AndroidSmallFourScreen(
//       {Key? key, required this.phoneNumber, this.verificationId})
//       : super(key: key);

//   @override
//   State<AndroidSmallFourScreen> createState() => _AndroidSmallFourScreenState();
// }

// class _AndroidSmallFourScreenState extends State<AndroidSmallFourScreen> {
//   bool _loading = false;
//   late String _verificationId;
//   bool _isOtpVerified = false;
//   TextEditingController _otpController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.verificationId != null) {
//       _verificationId = widget.verificationId!;
//     } else {
//       // If no verificationId is passed (Fallback scenario)
//       Navigator.pop(context);
//     }
//   }

//   void verifyOtp() async {
//     setState(() => _loading = true);

//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId,
//         smsCode: _otpController.text.trim(),
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);

//       // Check user existence in the system after successful verification
//       await checkIfUserExists();
//     } catch (e) {
//       setState(() => _loading = false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('OTP verification failed: ${e.toString()}'), backgroundColor: Colors.red),
//       );
//     }
//   }

//   Future<void> checkIfUserExists() async {
//     final url = Uri.parse('https://api.appment.in/api/patient/user/${widget.phoneNumber}');
//     final headers = {
//       'X-Device': 'ANDROID',
//       'X-App-Version': '5.0.0',
//       'Accept': 'application/json',
//     };

//     try {
//       final response = await http.get(url, headers: headers);
//       final statusCode = response.statusCode;

//       if (statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         final String? firstName = responseData['firstName'];

//         if (firstName != null && firstName.trim().isNotEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Welcome back, $firstName!"), backgroundColor: Colors.green),
//           );
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => AndroidSmallSixScreen()),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Welcome! Please complete your profile."), backgroundColor: Colors.blue),
//           );
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => AndroidSmallFiveScreen()),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("User not found. Please sign up."), backgroundColor: Colors.orange),
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => AndroidSmallFiveScreen()),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("An error occurred: $e"), backgroundColor: Colors.red),
//       );
//     } finally {
//       setState(() => _loading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("OTP Verification"),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Enter the OTP sent to +91${widget.phoneNumber}",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 30),
//             TextField(
//               controller: _otpController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "OTP",
//                 hintText: "Enter OTP",
//                 border: OutlineInputBorder(),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//             ),
//             SizedBox(height: 20),
//             _loading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: verifyOtp,
//                     child: Text("Verify OTP"),
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white, backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                     ),
//                   ),
//             SizedBox(height: 20),
//             if (_isOtpVerified)
//               Text("OTP Verified!", style: TextStyle(color: Colors.green)),
//           ],
//         ),
//       ),
//     );
//   }
// }
