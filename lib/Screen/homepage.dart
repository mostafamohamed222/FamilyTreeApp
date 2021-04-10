import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/MyDrawer.dart';
import 'package:treeapp/Screen/listview.dart';
import 'package:treeapp/Screen/treepage.dart';
import 'package:treeapp/models/memberContorller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ch.length,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.brown,
          ),
          backgroundColor: Colors.white,
          title: TabBar(
            indicatorColor: Colors.yellow,
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
  Choice(title: "شجرة العايلة", icon: Icons.pages_rounded),
];

class PageChoice extends StatelessWidget {
  final Choice choice;
  PageChoice(this.choice);

  @override
  Widget build(BuildContext context) {
    return choice.icon == Icons.list_rounded ? FamilyList() : FamilyTree();
  }
}
