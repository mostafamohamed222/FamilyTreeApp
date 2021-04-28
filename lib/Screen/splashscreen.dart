import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/homepage.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Provider.of<MemberContorller>(context, listen: false)
        .allMember
        .length ==
        0) {
      WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
          Provider.of<MemberContorller>(context, listen: false)
              .getMembersData();
        },
      );
    }
    Timer(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => Initializer()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.brown
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.brown,
                        child: Image.asset(
                          'assets/2.png',
                          width: 100,
                          height: 90,
                        ),

                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.amber
                      )
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
class Initializer extends StatefulWidget {
  @override
  _InitializerState createState() => _InitializerState();
}
class _InitializerState extends State<Initializer> {
  FirebaseAuth _auth;
  User _user;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    this._user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    // select();
    return isLoading ? Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ) :_user==null?Login():HomePage()
    ;
  }
}
