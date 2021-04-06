import 'package:flutter/material.dart';
import 'package:treeapp/widget/card.dart';
import 'package:treeapp/widget/search.dart';

class FamilyList extends StatefulWidget {
  FamilyList({Key key}) : super(key: key);

  @override
  _FamilyListState createState() => _FamilyListState();
}

class _FamilyListState extends State<FamilyList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: MediaQuery.of(context).size.height * .12,
                child: CardCustome(),
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
