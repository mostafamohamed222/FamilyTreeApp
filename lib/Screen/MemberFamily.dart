import 'package:flutter/material.dart';
import 'package:treeapp/widget/card.dart';

class MemberFamily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
