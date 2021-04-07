import 'package:flutter/material.dart';
import 'package:otp_screen/otp_screen.dart';
import 'package:treeapp/Screen/seccessverified.dart';

Future<String> validateOtp(String otp) async {
  await Future.delayed(Duration(milliseconds: 2000));
  if (otp == "1234") {
    return null;
  } else {
    return "الكود غير صحيح";
  }
}

void moveToNextScreen(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Success()));
}

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpScreen(
        otpLength: 4,
        validateOtp: validateOtp,
        routeCallback: moveToNextScreen,
        titleColor: Colors.brown,
        themeColor: Colors.brown,
        title: "التحقق من رقم الهاتف",
        subTitle: "الرجاء ادخال الكود المرسل الي رقم موبايلك",
        icon: Icon(
          Icons.send_to_mobile,
        ),
      ),
    );
  }
}
