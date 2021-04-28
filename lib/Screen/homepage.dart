import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/MyDrawer.dart';
import 'package:treeapp/Screen/listview.dart';
import 'package:treeapp/Screen/treepage.dart';
import 'package:treeapp/models/memberContorller.dart';

class HomePage extends StatefulWidget {
  String phone;
  HomePage({this.phone});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth;
  User _user;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    this._user = _auth.currentUser;

    print("end home");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(_user.phoneNumber);
    Provider.of<MemberContorller>(context, listen: false).userNumber =_user.phoneNumber;
    return DefaultTabController(
      initialIndex: 1,
      length: ch.length,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.brown,
          ),
          backgroundColor: Colors.white,
          title: TabBar(
            isScrollable: true,
            indicatorColor: Colors.amber,
            indicatorWeight: 5.0,
            tabs: ch.map((e) {
              return Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      e.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.brown,
                      ),
                    ),
                    Icon(
                      e.icon,
                      color: Colors.brown,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
            children: ch.map((e) {
              return PageChoice(e);
            }).toList()),
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;
  Choice({this.icon, this.title});
}

List<Choice> ch = [
  Choice(title: "افراد العايلة", icon: Icons.list_rounded),
  Choice(title: "شجرة العايلة", icon: Icons.family_restroom_rounded),
];

class PageChoice extends StatelessWidget {
  final Choice choice;
  PageChoice(this.choice);

  @override
  Widget build(BuildContext context) {
    return choice.icon == Icons.list_rounded ? FamilyList() : GraphViewPage();
  }
}