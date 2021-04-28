import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/MemberFamily.dart';
import 'package:treeapp/Screen/details.dart';
import 'package:treeapp/Screen/memberparent.dart';
import 'package:treeapp/models/memberContorller.dart';

import 'MemberCouple.dart';

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 3,
      length: hch.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          iconTheme: IconThemeData(color: Colors.brown),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                color: Colors.yellow[600],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          Provider.of<MemberContorller>(context, listen: false)
                              .currentModel
                              .image),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Provider.of<MemberContorller>(context, listen: false)
                            .currentModel
                            .name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.yellow[600],
              child: TabBar(
                indicatorColor: Colors.brown,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: hch.map((e) {
                  return Tab(
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              e.title,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.brown,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                  children: hch.map((e) {
                    return PageChoice(e);
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  Choice({this.title});
}

List<Choice> hch = [
  Choice(title: "الازواج"),
  Choice(title: "الابناء"),
  Choice(title: "الوالدين"),
  Choice(title: "تفاصيل"),
];

class PageChoice extends StatelessWidget {
  final Choice choice;
  PageChoice(this.choice);

  @override
  Widget build(BuildContext context) {
    return choice.title == "تفاصيل"
        ? Details()
        : choice.title == "الابناء"
        ? MemberSons()
        : choice.title == "الوالدين"
        ? MemberParents()
        : MemberCouple();
  }
}