import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:otp_screen/otp_screen.dart';
import 'package:treeapp/Screen/homepage.dart';

enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORM_STATE }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationIdd;
  String phone;
  bool showLoading = false;
  void signInWithPhoneAuthCredential(AuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      print('12456484');
      setState(() {
        showLoading = false;
      });
      if (authCredential?.user != null) {
        print('12456484hahahah');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      print('hahahhaFailed with error code: ${e.code}');
      print(e.message);
      setState(() {
        showLoading = false;
      });
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: Text(e.message)));
    }
  }

  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp != null) {
      print(otp + "dah ely enta ktbto11111");
      final phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationIdd, smsCode: otp.trim());
      print(otp + "dah ely enta ktbto22222");
      signInWithPhoneAuthCredential(phoneAuthCredential);
      print("ebrdenaaaa   " + phoneAuthCredential.toString());
    } else {
      print(otp + "dah ely enta ktbto");
    }
  }

  Future<void> verifyPhone() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: "+2" + phoneController.text,
        timeout: Duration(seconds: 60),
        verificationCompleted: (phoneAuthCredential) async {
          setState(() {
            final authCredential =
                _auth.signInWithCredential(phoneAuthCredential);
            showLoading = false;
          });
          signInWithPhoneAuthCredential(phoneAuthCredential);
        },
        verificationFailed: (verificationFailed) {
          setState(() {
            showLoading = false;
          });
          _scaffoldKey.currentState.showSnackBar(
              new SnackBar(content: Text(verificationFailed.message)));
        },
        codeSent: (verificationId, [resendingToken]) async {
          print(verificationId);
          setState(() {
            showLoading = false;
            this.verificationIdd = verificationId;
            currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          });
        },
        codeAutoRetrievalTimeout: (verificationIdd) async {});
  }

  getMobileFOrmWidget(context) {
    return Column(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/2.png',
            width: 100,
            height: 90,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'تسجيل الدخول',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.brown,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: phoneController,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'التسجيل برقم الهاتف ',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 8.0),
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.brown,
            child: MaterialButton(
              onPressed: () async {
                setState(() {
                  showLoading = true;
                  phone = phoneController.text;
                });
                if (FirebaseAuth.instance.currentUser?.uid != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  verifyPhone();
                }
              },
              minWidth: MediaQuery.of(context).size.width,
              child: Text(
                " دخول ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  getOTPFOrmWidget(context) {
    return OtpScreen(
      validateOtp: validateOtp,
      otpLength: 6,
      titleColor: Colors.brown,
      themeColor: Colors.brown,
      title: "التحقق من رقم الهاتف",
      subTitle: "الرجاء ادخال الكود المرسل الي رقم موبايلك",
      icon: Icon(
        Icons.send_to_mobile,
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFOrmWidget(context)
                  : getOTPFOrmWidget(context)),
    );
  }
}
