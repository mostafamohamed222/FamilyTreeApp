// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:otp_screen/otp_screen.dart';
// import 'package:treeapp/Screen/seccessverified.dart';

// import 'homepage.dart';

// void moveToNextScreen(context) {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
// }

// class VerificationScreen extends StatefulWidget {
//   String phone;
//   VerificationScreen({@required this.phone});
//   @override
//   _VerificationScreenState createState() => _VerificationScreenState();
// }

// class _VerificationScreenState extends State<VerificationScreen> {
//   Future<String> validateOtp(String otp) async {
//     await Future.delayed(Duration(milliseconds: 2000));
//     FirebaseAuth _auth = FirebaseAuth.instance;
//     _auth.verifyPhoneNumber(
//       phoneNumber: widget.phone,
//       timeout: Duration(seconds: 60),
//       verificationCompleted: (AuthCredential credential) async {
//         AuthResult result = await _auth.signInWithCredential(credential);
//         FirebaseUser user = result.user;
//         if (user != null) {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => HomePage()));
//         } else {
//           print('error');
//         }
//       },
//       verificationFailed: (AuthException exception) {
//         print(exception);
//       },
//       codeSent: (String verificationId, [int forceResendingToken]) async {
//         final code = otp.trim();
//         print(code);
//         AuthCredential credential = await PhoneAuthProvider.credential(
//             verificationId: verificationId, smsCode: code);
//         AuthResult result = await _auth.signInWithCredential(credential);
//         FirebaseUser user = result.user;
//         if (user != null) {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => HomePage()));
//         } else {
//           print('error1');
//         }
//       },
//     );

//     if (otp != null) {
//       final String code = otp;
//       print(otp);
//       return otp;
//     } else {
//       return "الكود غير صحيح";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: OtpScreen(
//         validateOtp: validateOtp,
//         otpLength: 6,
//         titleColor: Colors.brown,
//         themeColor: Colors.brown,
//         title: "التحقق من رقم الهاتف",
//         subTitle: "الرجاء ادخال الكود المرسل الي رقم موبايلك",
//         icon: Icon(
//           Icons.send_to_mobile,
//         ),
//       ),
//     );
//   }
// }
