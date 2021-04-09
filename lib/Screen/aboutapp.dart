import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text(
          'حول التطبيق',
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
            child: Container(
              color: Colors.white60,
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.width * 0.15,
              child: DropdownButton<String>(
                  isExpanded: true,
                  elevation: 16,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Text(
                      'عن التطبيق',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  style: const TextStyle(color: Colors.deepPurple),
                  icon: const Icon(
                    Icons.keyboard_arrow_up_outlined,
                  ),
                  iconSize: 24,
                  iconEnabledColor: Colors.brown,
                  underline: Container(
                    height: 2,
                    color: Colors.black12,
                  ),
                  onChanged: (String newValue) {},
                  items: [
                    DropdownMenuItem(
                      value: "1",
                      child: Column(
                        children: <Widget>[
                          // SizedBox(width: 10),
                          // Image.asset(
                          //   'assets/1.png',
                          // ),
                          Center(
                            child: Text(
                              "هنكتب الكلام هنا ياااا",
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 20),
            child: Container(
              color: Colors.white60,
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.width * 0.15,
              child: DropdownButton<String>(
                  isExpanded: true,
                  elevation: 16,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Text(
                      'اجصائيات',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  style: const TextStyle(color: Colors.deepPurple),
                  icon: const Icon(
                    Icons.keyboard_arrow_up_outlined,
                  ),
                  iconSize: 24,
                  iconEnabledColor: Colors.brown,
                  underline: Container(
                    height: 2,
                    color: Colors.black12,
                  ),
                  onChanged: (String newValue) {},
                  items: [
                    DropdownMenuItem(
                      value: "1",
                      child: Column(
                        children: <Widget>[
                          SizedBox(width: 10),
                          // Image.asset(
                          //   'assets/1.png',
                          // ),
                          Center(
                            child: Text(
                              "هنكتب الكلام هنا ياااا",
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
