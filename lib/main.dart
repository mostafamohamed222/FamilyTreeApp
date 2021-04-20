import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/homepage.dart';
import 'package:treeapp/models/memberContorller.dart';

import 'Screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  //       "parent": {
  //         "mother": "-MXv_RBltqYDChPuGVf3",
  //         "father": "-MXv_RBltqYDChPuGVf3",
  //       },
  //       "son": ["-MY0Vp3Lbn8GKHWXrMs3", "-MY0Vp3Lbn8GKHWXrMs3"],
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
        home: HomePage(
          phone: "01151536008",
        ),
      ),
    );
  }
}
