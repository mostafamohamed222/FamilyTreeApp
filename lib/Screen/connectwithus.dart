import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _tittleTextController = TextEditingController();
  TextEditingController _comentTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: Text('اتصل بنا'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          alignment: Alignment.topRight,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(20, 45, 20, 45),
                  //   child: Image.asset(
                  //     'assets/1.png',
                  //     fit: BoxFit.cover,
                  //     width: double.infinity,
                  //     height: 110,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              hintText: ' البريد الالكتروني ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.end,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'من فضلك ادخل البريد الالكتروني';
                              } else {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value)) {
                                  return 'من فضلك ادخل البريد الالكتروني الصحيح ';
                                }
                                return null;
                              }
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: TextFormField(
                            controller: _tittleTextController,
                            decoration: InputDecoration(
                              hintText: ' الموضوع ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.end,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'من فضلك سبب الاتصال';
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(0.4),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: TextFormField(
                            controller: _comentTextController,
                            decoration: InputDecoration(
                              hintText: ' اكتب رسالتك هنا ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            keyboardType: TextInputType.multiline,
                            // minLines: 1,
                            // maxLines: 5,
                            //maxLines: null,
                            textAlign: TextAlign.end,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'من فضلك ادخل الرساله';
                              } else {
                                return null;
                              }
                            }),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactUs()));
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        child: Text(
                          " تم ",
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
    );
  }
}
