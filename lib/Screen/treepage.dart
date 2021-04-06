import 'package:flutter/material.dart';
import 'package:treeapp/widget/search.dart';

class FamilyTree extends StatefulWidget {
  FamilyTree({Key key}) : super(key: key);

  @override
  _FamilyTreeState createState() => _FamilyTreeState();
}

class _FamilyTreeState extends State<FamilyTree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(),
      ],
    );
  }
}
