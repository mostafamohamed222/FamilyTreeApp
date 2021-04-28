import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screen/splashscreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MemberContorller(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Tajawal'),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}

