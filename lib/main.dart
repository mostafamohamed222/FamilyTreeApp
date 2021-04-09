import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:treeapp/Screen/homepage.dart';
import 'package:http/http.dart' as http;

import 'Screen/LoginScreen.dart';

void main() {
  // http.post(
  //   "https://treeproject-4a712-default-rtdb.firebaseio.com/member.json",
  //   body: json.encode(
  //     {
  //       "sss": "sss",
  //       "id": "25",
  //     },
  //   ),
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
