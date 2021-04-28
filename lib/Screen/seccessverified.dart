import 'package:flutter/material.dart';
import 'package:treeapp/Screen/homepage.dart';

class Success extends StatelessWidget {

  final String mobile;
  Success({Key key, @required this.mobile}) : super(key: key);
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 40),
                      child: Icon(
                        Icons.mobile_friendly,
                        size: 70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'تم التحقق من رقم هاتفك بنجاح',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                                    builder: (context) => HomePage(phone: mobile,)));
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
      ],
    ));
  }
}
