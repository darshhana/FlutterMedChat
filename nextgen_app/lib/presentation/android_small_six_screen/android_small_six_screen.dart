// // import 'package:flutter/material.dart';
// // import 'package:flutter_chat_types/flutter_chat_types.dart';
// // import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// // import '../../core/app_export.dart';
// // import '../../widgets/app_bar/appbar_leading_image.dart';
// // import '../../widgets/app_bar/appbar_subtitle.dart';
// // import '../../widgets/app_bar/appbar_title.dart';
// // import '../../widgets/app_bar/custom_app_bar.dart';
// // import '../../widgets/custom_icon_button.dart';
// // import '../../widgets/custom_text_form_field.dart';
// // import '../android_small_seven_screen/android_small_seven_screen.dart';
// // import 'package:flutter/material.dart';

// // import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// // import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:file_picker/file_picker.dart';
// // import 'dart:io';

// // class AndroidSmallSixScreen extends StatefulWidget {
// //   @override
// //   _AndroidSmallSixScreenState createState() => _AndroidSmallSixScreenState();
// // }

// // class _AndroidSmallSixScreenState extends State<AndroidSmallSixScreen> {
// //   final TextEditingController _messageController = TextEditingController();
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   final FirebaseAuth _auth = FirebaseAuth.instance;

// //   void _sendMessage() async {
// //     if (_messageController.text.isNotEmpty) {
// //       await _firestore.collection('chats').add({
// //         'text': _messageController.text,
// //         'senderId': _auth.currentUser?.uid,
// //         'timestamp': FieldValue.serverTimestamp(),
// //         'type': 'text',
// //       });
// //       _messageController.clear();
// //     }
// //   }

// //   Future<void> _uploadFile() async {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
// //     if (result != null) {
// //       File file = File(result.files.single.path!);
// //       String fileName = result.files.single.name;
// //       Reference ref = FirebaseStorage.instance.ref().child('uploads/$fileName');
// //       await ref.putFile(file);
// //       String fileURL = await ref.getDownloadURL();

// //       await _firestore.collection('chats').add({
// //         'text': fileURL,
// //         'senderId': _auth.currentUser?.uid,
// //         'timestamp': FieldValue.serverTimestamp(),
// //         'type': 'file',
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Doctor Chat")),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: StreamBuilder(
// //               stream: _firestore.collection('chats').orderBy('timestamp').snapshots(),
// //               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //                 if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
// //                 return ListView(
// //                   children: snapshot.data!.docs.map((doc) {
// //                     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// //                     return ListTile(
// //                       title: data['type'] == 'file'
// //                           ? GestureDetector(
// //                               onTap: () {},
// //                               child: Text("File: ${data['text']}", style: TextStyle(color: Colors.blue)),
// //                             )
// //                           : Text(data['text']),
// //                     );
// //                   }).toList(),
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               children: [
// //                 IconButton(
// //                   icon: Icon(Icons.attach_file),
// //                   onPressed: _uploadFile,
// //                 ),
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _messageController,
// //                     decoration: InputDecoration(hintText: "Type a message..."),
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: Icon(Icons.send),
// //                   onPressed: _sendMessage,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';
// import '../android_small_seven_screen/android_small_seven_screen.dart';

// class AndroidSmallSixScreen extends StatefulWidget {
//   @override
//   _AndroidSmallSixScreenState createState() => _AndroidSmallSixScreenState();
// }

// class _AndroidSmallSixScreenState extends State<AndroidSmallSixScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final ScrollController _scrollController = ScrollController();

//   final String patientId = "user_123"; // Your app's user ID
//   final String doctorId = "doctor_001"; // Static doctor ID

//   String get chatId {
//     final ids = [patientId, doctorId]..sort();
//     return ids.join("_");
//   }

//   void _sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       await _firestore.collection('chats').doc(chatId).collection("messages").add({
//         'text': _messageController.text,
//         'senderId': patientId,
//         'receiverId': doctorId,
//         'timestamp': FieldValue.serverTimestamp(),
//         'type': 'text',
//         'read':false,
//       });
//       _messageController.clear();
//       _scrollToBottom();
//     }
//   }

//   Future<void> _uploadFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
//     if (result != null && result.files.single.path != null) {
//       File file = File(result.files.single.path!);
//       String fileName = result.files.single.name;
//       // try{}
//       Reference ref = FirebaseStorage.instance.ref().child('uploads/$fileName');
//       await ref.putFile(file);
//       String fileURL = await ref.getDownloadURL();

//       await _firestore.collection('chats').doc(chatId).collection("messages").add({
//         'text': fileURL,
//         'senderId': patientId,
//         'receiverId': doctorId,
//         'timestamp': FieldValue.serverTimestamp(),
//         'type': 'file',
//         'fileName': fileName
//       });
//       _scrollToBottom();
//     }
//   }

//   void _scrollToBottom() {
//     Future.delayed(Duration(milliseconds: 100), () {
//       _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//     });
//   }

//   Widget _buildMessageBubble(Map<String, dynamic> data, bool isMe) {
//     final bgColor = isMe ? Colors.blue[100] : Colors.grey[200];
//     final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
//     final borderRadius = isMe
//         ? BorderRadius.only(
//             topLeft: Radius.circular(12),
//             topRight: Radius.circular(12),
//             bottomLeft: Radius.circular(12))
//         : BorderRadius.only(
//             topLeft: Radius.circular(12),
//             topRight: Radius.circular(12),
//             bottomRight: Radius.circular(12));

//     return Column(
//       crossAxisAlignment: align,
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//           decoration: BoxDecoration(
//             color: bgColor,
//             borderRadius: borderRadius,
//           ),
//           child: data['type'] == 'file'
//               ? GestureDetector(
//                   onTap: () {
//                     // Open file URL
//                   },
//                   child: Text("📎 ${data['fileName'] ?? 'Open File'}",
//                       style: TextStyle(color: Colors.blue)),
//                 )
//               : Text(data['text']),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Doctor Chat")),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder(
//               stream: _firestore
//                   .collection('chats')
//                   .doc(chatId)
//                   .collection("messages")
//                   .orderBy('timestamp')
//                   .snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
//                 return ListView(
//                   controller: _scrollController,
//                   children: snapshot.data!.docs.map((doc) {
//                     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//                     bool isMe = data['senderId'] == patientId;
//                     return _buildMessageBubble(data, isMe);
//                   }).toList(),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.attach_file, color: Colors.blue),
//                   onPressed: _uploadFile,
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       hintText: "Type a message...",
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send, color: Colors.blue),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton.icon(
//               icon: Icon(Icons.medical_services, size: 24),
//               label: Text("Our Services", style: TextStyle(fontSize: 18)),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.blue,
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AndroidSmallSevenScreen(),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AndroidSmallSixScreen extends StatefulWidget {
//   const AndroidSmallSixScreen({Key? key}) : super(key: key);

//   @override
//   State<AndroidSmallSixScreen> createState() => _AndroidSmallSixScreenState();
// }

// class _AndroidSmallSixScreenState extends State<AndroidSmallSixScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final ScrollController _scrollController = ScrollController();

//   final String patientId = 'patient123'; // Replace with real ID logic
//   final String doctorId = 'doctor456';   // Replace with real ID logic

//   late String chatId;
//   bool _isSending = false;

//   @override
//   void initState() {
//     super.initState();
//     chatId = patientId.compareTo(doctorId) < 0 ? '$patientId\_$doctorId' : '$doctorId\_$patientId';
//   }

//   void _sendMessage() async {
//     final text = _messageController.text.trim();
//     if (text.isEmpty) return;

//     setState(() => _isSending = true);

//     await _firestore.collection('chats').doc(chatId).collection("messages").add({
//       'text': text,
//       'senderId': patientId,
//       'receiverId': doctorId,
//       'timestamp': FieldValue.serverTimestamp(),
//       'type': 'text',
//       'read': false,
//     });

//     _messageController.clear();
//     setState(() => _isSending = false);
//     _scrollToBottom();
//   }

//   void _scrollToBottom() {
//     Future.delayed(const Duration(milliseconds: 100), () {
//       _scrollController.animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final messageStream = _firestore
//         .collection('chats')
//         .doc(chatId)
//         .collection("messages")
//         .orderBy('timestamp', descending: false)
//         .snapshots();

//     return Scaffold(
//       appBar: AppBar(title: const Text("Chat")),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder(
//               stream: messageStream,
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

//                 final messages = snapshot.data!.docs;

//                 return ListView.builder(
//                   controller: _scrollController,
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final msg = messages[index];
//                     final isMe = msg['senderId'] == patientId;
//                     return Container(
//                       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: isMe ? Colors.blue[200] : Colors.grey[300],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         padding: const EdgeInsets.all(10),
//                         child: Text(msg['text']),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           const Divider(height: 1),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: const InputDecoration(hintText: 'Type your message...'),
//                   ),
//                 ),
//                 _isSending
//                     ? const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)),
//                       )
//                     : IconButton(
//                         icon: const Icon(Icons.send, color: Colors.blue),
//                         onPressed: _sendMessage,
//                       ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import '../android_small_seven_screen/android_small_seven_screen.dart';

class FullImageScreen extends StatelessWidget {
  final String imageUrl;

  const FullImageScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(
          // pinch to zoom
          child: Image.network(
            imageUrl,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 50),
                    Text('Failed to load image',
                        style: TextStyle(color: Colors.red)),
                  ],
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey[200],
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AndroidSmallSixScreen extends StatefulWidget {
  final int patientId;
  const AndroidSmallSixScreen({Key? key, required this.patientId})
      : super(key: key);

  @override
  State<AndroidSmallSixScreen> createState() => _AndroidSmallSixScreenState();
}

class _AndroidSmallSixScreenState extends State<AndroidSmallSixScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final DatabaseReference dbRef = FirebaseDatabase.instance.ref("chat-data");

  final int doctorId = 1; // Replace with actual doctor ID
  // late final String chatId;

  bool _isSending = false;
  double _uploadProgress = 0.0;
  bool _isUploading = false;

  // Removed online status management for simplicity

  final String doctorImageUrl =
      "https://cdn-icons-png.flaticon.com/512/3774/3774299.png";

  @override
  void initState() {
    super.initState();
    // chatId = widget.patientId.compareTo(doctorId) < 0
    //     ? '$widget.patientId\_$doctorId'
    //     : '$doctorId\_$widget.patientId';
    print(FirebaseStorage.instance.ref().bucket);

    print("🔧 Chat Screen Initialized for patientId = ${widget.patientId}");
    signInAdmin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> signInAdmin() async {
    try {
      // Check if user is already signed in
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        print("Already logged in as ${currentUser.email}");

        // Scroll to bottom after successful login (like WhatsApp)
        Future.delayed(Duration(milliseconds: 1000), () {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          }
        });
        return;
      }

      // If not signed in, sign in as admin
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'admin@appment.in',
        password: 'Caliber2@',
      );
      print("logged in as ${credential.user?.email}");

      // Scroll to bottom after successful login (like WhatsApp)
      Future.delayed(Duration(milliseconds: 1000), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        }
      });
    } catch (e) {
      print("failed login: $e ");

      _scrollToBottom(instant: true);
    }
  }

  // Show exit confirmation dialog
  void _showExitConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
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
                  Icons.exit_to_app,
                  color: Color(0xFF1976D2), // Blue theme
                  size: 20,
                ),
              ),
              SizedBox(width: 12),
              Text(
                "Exit Chat",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          content: Text(
            "Are you sure you want to exit the chat?",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                SystemNavigator.pop(); // Exit the app
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1976D2), // Blue theme
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                "Exit",
                style: TextStyle(
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

  // Online status methods removed for simplicity

  // void fetchMessagesForPatient(int patientId) async {
  //   final snapshot =
  //       await dbRef.orderByChild("patientId").equalTo(patientId).once();
  //   final data = snapshot.snapshot.value as Map?;
  //   if (data != null) {
  //     final messages = data.entries.map((entry) {
  //       final value = entry.value as Map;
  //       return {
  //         "message": value["message"],
  //         "doctor": value["doctor"],
  //         "dateSent": value["dateSent"],
  //         "patientId": value["patientId"]
  //       };
  //     }).toList();
  //     print("✅ Found ${messages.length} messages for patientId = $patientId");

  //   } else{
  //         print("❌ No messages found for patientId = $patientId");

  //   }
  // }

  void _sendMessage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("not signed in!");
      return;
    }
    print("sending message as : ${user.email}");
    final text = _messageController.text.trim();
    if (text.isEmpty) {
      print("tried to send empty message");
      return;
    }

    setState(() => _isSending = true);
    print("sending message...");
    await dbRef.push().set({
      'message': text,
      'patientId': widget.patientId,
      'doctor': doctorId,
      "patient": "patient name",
      "dateSent": DateTime.now().millisecondsSinceEpoch,
      'type': 'text',
      'sentBy': 'PATIENT',
    });
    print("message sent...");
    _messageController.clear();
    setState(() => _isSending = false);

    // Scroll to bottom after sending message (like WhatsApp)
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
//the very correct uploadfile function.

  // Future<void> _uploadFile() async {
  //   print("inside uploadfile...");
  //   FilePickerResult? result =
  //       await FilePicker.platform.pickFiles(allowMultiple: true);
  //   print("picked the file");
  //   if (result != null && result.files.single.path != null) {
  //     File file = File(result.files.single.path!);
  //     String fileName = result.files.single.name;

  //     try {
  //       print("inside try of try upload...");
  //       final storageRef = FirebaseStorage.instance
  //           .ref()
  //           .child('uploads/${widget.patientId}/$fileName');
  //       final uploadTask = await storageRef.putFile(file);

  //       //listen to progess
  //       uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
  //         double progress = snapshot.bytesTransferred / snapshot.totalBytes;
  //         print("Upload Progress: ${(progress * 100).toStringAsFixed(2)}%");
  //       });
  //       await uploadTask;

  //       final downloadURL = await storageRef.getDownloadURL();
  //       print("got everything");
  //       await dbRef.push().set({
  //         'message': downloadURL,
  //         'type': 'file',
  //         'fileName': fileName,
  //         'patientId': widget.patientId,
  //         'doctor': doctorId,
  //         'patient': "patient name",
  //         'dateSent': DateTime.now().millisecondsSinceEpoch,
  //         'sentBy': 'PATIENT',
  //       });
  //       print("pushed in dataset too...");
  //       _scrollToBottom();
  //     } catch (e) {
  //       print("Error uploading file: $e");
  //     }
  //   }
  // }

  //long press functionality
  void _showReactionBottomSheet(BuildContext context, Map messageData) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['👍', '❤️', '😂', '😢', '🔥'].map((emoji) {
              return GestureDetector(
                onTap: () {
                  // OPTIONAL: Save to Firebase
                  print('Reacted with $emoji to: ${messageData['message']}');
                  Navigator.pop(context);
                },
                child: Text(emoji, style: const TextStyle(fontSize: 28)),
              );
            }).toList(),
          ),
        );
      },
    );
  }

//trying linear progress bar for uploading
  Future<void> _uploadFile() async {
    print("inside uploadfile...");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );
    print("picked the file");

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      String fileName = result.files.single.name;

      // Generate unique filename to avoid conflicts
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String uniqueFileName = '${timestamp}_$fileName';

      try {
        print("inside try of try upload...");
        print("Patient ID: ${widget.patientId}");
        print("File name: $fileName");
        print("Unique file name: $uniqueFileName");

        // Check authentication
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          throw Exception('User not authenticated');
        }
        print("User authenticated: ${user.uid}");

        // Debug Firebase Storage instance
        print(
            "Firebase Storage bucket: ${FirebaseStorage.instance.ref().bucket}");
        print("Firebase Storage app: ${FirebaseStorage.instance.app.name}");

        // Test Firebase Storage connection by trying to get a simple reference
        try {
          final testRef = FirebaseStorage.instance.ref().child('test');
          print("Firebase Storage connection test successful");
        } catch (e) {
          print("Firebase Storage connection test failed: $e");
        }

        // Skip test upload for now to focus on main upload
        print("Skipping test upload - proceeding with main upload");

        // Create the storage reference in uploads folder
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('uploads/${widget.patientId}/$uniqueFileName');

        print("Storage path: $uniqueFileName");
        print("Storage reference: ${storageRef.fullPath}");

        // Check if file exists and get its size
        if (!await file.exists()) {
          throw Exception('Selected file does not exist');
        }

        int fileSize = await file.length();
        print("File size: ${fileSize} bytes");

        // Set upload metadata
        final metadata = SettableMetadata(
          contentType: _getContentType(fileName),
          customMetadata: {
            'patientId': widget.patientId.toString(),
            'originalName': fileName,
            'uploadedAt': DateTime.now().toIso8601String(),
          },
        );

        UploadTask uploadTask = storageRef.putFile(file, metadata);

        setState(() {
          _isUploading = true;
          _uploadProgress = 0.0;
        });

        // Listen to upload progress
        uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
          double progress = snapshot.bytesTransferred / snapshot.totalBytes;
          setState(() {
            _uploadProgress = progress;
          });
          print("Upload Progress: ${(progress * 100).toStringAsFixed(2)}%");
        });

        // Wait for upload to complete
        await uploadTask;
        print("Upload completed successfully");

        // Get download URL
        String downloadURL = await storageRef.getDownloadURL();
        print("Download URL: $downloadURL");

        // Save to database
        await dbRef.push().set({
          'message': downloadURL,
          'type': 'file',
          'fileName': fileName,
          'uniqueFileName': uniqueFileName,
          'patientId': widget.patientId,
          'doctor': doctorId,
          'patient': "patient name",
          'dateSent': DateTime.now().millisecondsSinceEpoch,
          'sentBy': 'PATIENT',
          'fileSize': fileSize.toString(),
          'contentType': _getContentType(fileName),
        });

        setState(() {
          _isUploading = false;
          _uploadProgress = 0.0;
        });

        print("File uploaded and URL saved to DB successfully");

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File uploaded successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        // Scroll to bottom
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } catch (e) {
        print("Error uploading file: $e");
        print("Error type: ${e.runtimeType}");

        String errorMessage = 'Upload failed';
        if (e.toString().contains('object-not-found')) {
          errorMessage = 'Storage reference not found. Check permissions.';
        } else if (e.toString().contains('permission-denied')) {
          errorMessage = 'Permission denied. Check Firebase Storage rules.';
        } else if (e.toString().contains('network')) {
          errorMessage = 'Network error. Check your connection.';
        } else if (e.toString().contains('quota')) {
          errorMessage = 'Storage quota exceeded.';
        }

        setState(() {
          _isUploading = false;
          _uploadProgress = 0.0;
        });

        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _getContentType(String fileName) {
    String extension = fileName.toLowerCase().split('.').last;
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'txt':
        return 'text/plain';
      default:
        return 'application/octet-stream';
    }
  }

  // void _scrollToBottom() {
  //   Future.delayed(const Duration(milliseconds: 200), () {
  //     if (_scrollController.hasClients) {
  //       _scrollController.animateTo(_scrollController.position.maxScrollExtent,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeOut,
  //       );
  //     }
  //   });
  // }

  //ux scrolling
  void _scrollToBottom({bool instant = false}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: instant ? Duration.zero : const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Widget _buildMessageBubble(Map data, bool isMe) {

  //   final bgColor = isMe ? Color.fromARGB(255, 78, 158, 224) : Colors.grey[200];
  //   final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
  //   final borderRadius = BorderRadius.only(
  //     topLeft: const Radius.circular(12),
  //     topRight: const Radius.circular(12),
  //     bottomLeft: isMe ? const Radius.circular(12) : const Radius.circular(0),
  //     bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12),
  //   );

  //   return Column(
  //     crossAxisAlignment: align,
  //     children: [
  //       Container(
  //         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
  //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  //         decoration: BoxDecoration(
  //           color: bgColor,
  //           borderRadius: borderRadius,
  //         ),
  //         child: data['type'] == 'file'
  //             ? GestureDetector(
  //                 onTap: () {
  //                   final url = data['message'];
  //                   if (url != null) {
  //                     launchUrl(Uri.parse(url));
  //                   }
  //                 },
  //                 child: Text(
  //                   "📎 ${data['fileName'] ?? 'View File'}",
  //                   style: const TextStyle(
  //                       color: Colors.blue,
  //                       decoration: TextDecoration.underline),
  //                 ),
  //               )
  //             : Text(data['message']?? "no message"),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildMessageList(List messages){
  //   Map<String, List<Map>> groupedMessages = {};

  // for (var msg in messages) {
  //   DateTime date = msg['timestamp'].toDate(); // or msg['timestamp'] if it's already DateTime
  //   String dateKey = DateFormat('yyyy-MM-dd').format(date);

  //   if (!groupedMessages.containsKey(dateKey)) {
  //     groupedMessages[dateKey] = [];
  //   }
  //   groupedMessages[dateKey]!.add(msg);
  // }

  // final sortedKeys = groupedMessages.keys.toList()
  //   ..sort((a, b) => a.compareTo(b));

  // return ListView(
  //   padding: const EdgeInsets.only(bottom: 80),
  //   children: sortedKeys.expand((dateKey) {
  //     String dateLabel = _getDateLabel(DateTime.parse(dateKey));
  //     List<Map> dayMessages = groupedMessages[dateKey]!;

  //     return [
  //       Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 10),
  //         child: Center(
  //           child: Text(
  //             dateLabel,
  //             style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //       ),
  //       ...dayMessages.map((msg) {
  //         bool  = msg['senderId'] == currentUserId; // Replace this with your sender logic
  //         return _buildMessageBubble(msg, isMe);
  //       })
  //     ];
  //   }).toList(),
  // );
  // }
  Widget _buildMessageBubble(Map data, bool isMe) {
    final bgColor = isMe
        ? const Color(0xFF007AFF) // Your messages: dark blue
        : const Color(0xFFE3F2FD); // Doctor messages: light blue (blue theme)
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    // final time = data['dateSent'] != null
    //     ? DateFormat('hh:mm a')
    //         .format(DateTime.fromMillisecondsSinceEpoch(data['dateSent']))
    //     : '';
    String time = '';
    if (data['dateSent'] != null) {
      try {
        time = DateFormat('hh:mm a').format(
          DateTime.fromMillisecondsSinceEpoch(data['dateSent'] as int),
        );
      } catch (e) {
        time = 'Invalid time';
      }
    } else {
      time = 'No time';
    }

    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(12),
      topRight: const Radius.circular(12),
      bottomLeft: isMe ? const Radius.circular(12) : const Radius.circular(0),
      bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12),
    );

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: align,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: borderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data['type'] == 'file')
                      Builder(
                        builder: (context) {
                          final url = data['message'];
                          final fileName = data['fileName'] ?? 'View File';

                          if (fileName.endsWith(".jpg") ||
                              fileName.endsWith(".jpeg") ||
                              fileName.endsWith(".png")) {
                            //just the image in chat directly.easy and normal buit no ux.
                            // return Image.network(url, height: 200, fit: BoxFit.cover);
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        FullImageScreen(imageUrl: url),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  url,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 200,
                                      color: Colors.grey[300],
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.error,
                                              color: Colors.red, size: 30),
                                          Text('Image failed to load',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12)),
                                        ],
                                      ),
                                    );
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      height: 200,
                                      color: Colors.grey[200],
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                if (url != null) launchUrl(Uri.parse(url));
                              },
                              child: Text(
                                "📎 $fileName",
                                style: TextStyle(
                                  color: isMe
                                      ? Colors.white
                                      : const Color(
                                          0xFF0D47A1), // Blue theme file links
                                  // decoration: TextDecoration.underline,
                                ),
                              ),
                            );
                          }
                        },
                      )
                    else
                      Text(
                        data['message'] ?? "no message",
                        style: TextStyle(
                          fontSize: 16,
                          color: isMe
                              ? Colors.white
                              : const Color(
                                  0xFF1565C0), // Blue theme text for doctor
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 10,
                        color: isMe
                            ? Colors.white70
                            : const Color(0xFF1976D2), // Blue theme timestamp
                      ),
                    ),
                  ],

                  // ? GestureDetector(
                  //     onTap: () {
                  //       final url = data['message'];
                  //       if (url != null) {
                  //         launchUrl(Uri.parse(url));
                  //       }
                  //     },
                  //     child: Text(
                  //       "📎 ${data['fileName'] ?? 'View File'}",
                  //       style: const TextStyle(
                  //           color: Colors.blue,
                  //           decoration: TextDecoration.underline),
                  //     ),
                  //   )
                  // : Text(
                  //     data['message'] ?? "no message",
                  //     style: const TextStyle(fontSize: 16),
                  //   ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent default back behavior
      onPopInvoked: (didPop) async {
        if (!didPop) {
          // Show exit confirmation dialog
          _showExitConfirmationDialog();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          titleSpacing: 0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(doctorImageUrl),
                onBackgroundImageError: (exception, stackTrace) {
                  print('Failed to load doctor image: $exception');
                },
                child: doctorImageUrl.isEmpty
                    ? Icon(Icons.person, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dr. Vijay Ramanan",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "Available",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       //initiate video call, permission for video call
          //     },
          //     icon: const Icon(Icons.video_call, color: Colors.blueAccent),
          //   ),
          //   IconButton(
          //     onPressed: () {
          //       //navigation to doctors profile, website or something.
          //     },
          //     icon: const Icon(Icons.info_outline, color: Colors.black54),
          //   ),
          // ],
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<DatabaseEvent>(
                stream: dbRef
                    .orderByChild('patientId')
                    .equalTo(widget.patientId)
                    .onValue,
                builder: (context, snapshot) {
                  // Show loading spinner while data is being fetched
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text("Loading messages..."),
                        ],
                      ),
                    );
                  }

                  // Show no messages if data is null or empty
                  if (!snapshot.hasData ||
                      snapshot.data?.snapshot.value == null) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat_bubble_outline,
                              size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text("No messages yet.",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(height: 8),
                          Text("Start a conversation!",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ],
                      ),
                    );
                  }
                  // print("Sorting list: ${list.map((e) => e['someField'])}");

                  Map<dynamic, dynamic> messagesMap =
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                  print("fetched ${messagesMap.length} messages from db");

                  //filter and sort messages by datesent ascending
                  final messagesList = messagesMap.entries
                      .where((entry) => entry.value['dateSent'] != null)
                      .map((entry) => Map<String, dynamic>.from(entry.value))
                      .toList()
                    // ..sort((a, b) =>
                    //     (a['dateSent'] as int).compareTo(b['dateSent'] as int));
                    // ..sort((a, b) {
                    //   final aDate = a['dateSent'] ?? 0;
                    //   final bDate = b['dateSent'] ?? 0;
                    //   // print("adate: ${aDate}");
                    //   // print("bdate: ${bDate}");
                    //   if (aDate == null && bDate == null) return 0;
                    //   if (aDate == null) return 1; // push nulls to end
                    //   if (bDate == null) return -1;
                    //   return aDate.compareTo(bDate);
                    // });
                    ..sort((a, b) {
                      final aDate = a['dateSent'];
                      final bDate = b['dateSent'];

                      if (aDate is! int && bDate is! int) return 0;
                      if (aDate is! int) return 1;
                      if (bDate is! int) return -1;

                      return aDate.compareTo(
                          bDate); // Keep ascending order (oldest first, newest last)
                    });

                  //   // rif (aDate == null && bDate == null) return 0;
                  //   // if (aDate == null) return 1; // push nulls to end
                  //   // if (bDate == null) return -1;

                  //   return aDate.compareTo(bDate);
                  // }

                  //agar datesent null ka message chahiyee hee nahi...
                  //                 final messagesList = messagesMap.entries
                  //   .where((e) => e.value['dateSent'] != null)
                  //   .toList()
                  // ..sort((a, b) => (a.value['dateSent'] as int).compareTo(b.value['dateSent'] as int));

                  // }=> (a.value['dateSent'] as int)
                  //     .compareTo(b.value['dateSent'] as int));

                  //to debug the entry ids...

                  // for (var entry in messagesMap.entries) {
                  //   // print("entry key: ${entry.key}, dateSent: ${entry.value['dateSent']}");
                  // }

                  // Auto-scroll to bottom when messages are loaded (like WhatsApp)
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Future.delayed(Duration(milliseconds: 200), () {
                      if (_scrollController.hasClients) {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    });
                  });

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: messagesList.length,
                            itemBuilder: (context, index) {
                              final data = messagesList[index];
                              final isMe = data['sentBy'] == 'PATIENT';
                              return _buildMessageBubble(data, isMe);
                            },
                          ),
                        ),
                        if (_isUploading)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: LinearProgressIndicator(
                              value: _uploadProgress,
                              backgroundColor: Colors.grey[300],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.attach_file,
                                    color: Colors.blue),
                                onPressed: _uploadFile,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _messageController,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: "Type a message...",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[500]),
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  minLines: 1,
                                  maxLines: 4,
                                ),
                              ),
                              IconButton(
                                icon: _isSending
                                    ? const CircularProgressIndicator(
                                        strokeWidth: 2)
                                    : const Icon(Icons.send,
                                        color: Colors.blue),
                                onPressed: _isSending ? null : _sendMessage,
                              ),
                            ],
                          ),
                        ),
                        // Services button removed - not needed in chat screen
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
