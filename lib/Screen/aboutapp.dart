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
          ExpansionTile(
            title: Center(child: Text("عن التطبيق")),
            children: [
              Center(
                child: Text(
                  "هنكتب الكلام هنا ياااا",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Center(child: Text("احصائيات")),
            children: [
              Center(
                child: Text(
                  "هنكتب الكلام هنا ياااا",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
