import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:treeapp/models/memberContorller.dart';

import 'Screen/LoginScreen.dart';

void main() {
  // http.post(
  //   "https://treeproject-4a712-default-rtdb.firebaseio.com/member.json",
  //   body: json.encode(
  //     {
  //       "name": "اسلام احمد عبدالله",
  //       "age": "22",
  //       "job": "مبرمج",
  //       "image":
  //           "https://media.gettyimages.com/photos/young-man-working-at-home-in-the-evening-picture-id1181035364?s=612x612",
  //       "city": "جدة",
  //     },
  //   ),
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MemberContorller(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
