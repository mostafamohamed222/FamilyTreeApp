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
            child: CardCustome(
              age: "25",
              city: "مكة",
              image:
                  "https://media.gettyimages.com/photos/young-man-working-at-home-in-the-evening-picture-id1181035364?s=612x612",
              job: "طبيب",
              name: "حسام الدين احمد احمد",
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
