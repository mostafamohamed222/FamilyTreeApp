import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/MemberFamily.dart';
import 'package:treeapp/Screen/details.dart';
import 'package:treeapp/models/memberContorller.dart';

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
              height: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                color: Colors.yellow[600],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/handsome-young-businessman-shirt-eyeglasses_85574-6228.jpg?size=626&ext=jpg"),
                  ),
                  Text(
                    "احمد محمد علي حسن",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.yellow[600],
              child: TabBar(
                indicatorColor: Colors.brown,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: hch.map((e) {
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
  Choice(title: "الإخوة"),
  Choice(title: "الوالدين"),
  Choice(title: "تفاصيل"),
];

class PageChoice extends StatelessWidget {
  final Choice choice;
  PageChoice(this.choice);

  @override
  Widget build(BuildContext context) {
    return choice.title == "تفاصيل" ? Details() : MemberFamily();
  }
}
