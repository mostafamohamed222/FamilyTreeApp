import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          filed(filedTiltle: "اسم المستخدم", name: "احمد محمد علي حسن"),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          filed(filedTiltle: "المهنة", name: "طبيب عام"),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          filed(filedTiltle: "العمر ", name: "40  "),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

Widget filed({String name, String filedTiltle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    textDirection: TextDirection.rtl,
    children: [
      Text(
        filedTiltle,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      Text(name),
    ],
  );
}
