import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:treeapp/Screen/verifiedscreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numberTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          // alignment: Alignment.topCenter,
          // child: Image.asset('assets/icon/Logo.png')
          color: Colors.white.withOpacity(0.5),
          width: double.infinity,
          //height: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            alignment: Alignment.topRight,
            child: Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        // child: Image.asset(
                        //   'assets/logo.png',
                        //   fit: BoxFit.cover,
                        //   width: 100,
                        //   height: 90,
                        // ),
                      ),
                      Text(
                        'تسجيل الدخول                                            ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                                controller: _numberTextController,
                                decoration: InputDecoration(
                                  hintText:
                                      '                                        التسجيل برقم الهاتف ',
                                  icon: Icon(Icons.mobile_friendly_sharp),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'من فضلك أدخل رقم هاتفك ';
                                  } else {
                                    if (value.length < 5) {
                                      return ' من فضلك ادخل رقم صحيح !';
                                    }
                                    return null;
                                  }
                                }),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.brown,
                          child: MaterialButton(
                            onPressed: () async {
                              final String phone = _numberTextController.text;
                              if (_formKey.currentState.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VerificationScreen()));
                              } else {
                                // Fluttertoast.showToast(
                                //     msg:
                                //     " من فضلك ادخل رقم صحيح ",
                                //     toastLength: Toast.LENGTH_LONG,
                                //     gravity: ToastGravity.BOTTOM,
                                //     backgroundColor: Colors.red,
                                //     textColor: Colors.white,
                                //     fontSize: 16.0);
                                print("last line of Isolate");
                                return null;
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            )),
      ],
    ));
  }
}
