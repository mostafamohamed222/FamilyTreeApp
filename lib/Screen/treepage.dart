import 'package:flutter/material.dart';
import 'package:treeapp/widget/search.dart';
import 'package:graphite/graphite.dart';
import 'package:zoom_widget/zoom_widget.dart';

import 'dart:ui';

import 'package:graphite/core/matrix.dart';
import 'package:graphite/core/typings.dart';

import 'member.dart';

class FamilyTree extends StatefulWidget {
  FamilyTree({Key key}) : super(key: key);

  @override
  _FamilyTreeState createState() => _FamilyTreeState();
}

const String presetBasic =
    '[{"id":"A","next":["B"]},{"id":"B","next":["C","D","E"]},'
    '{"id":"C","next":["F"]},{"id":"D","next":["J"]},{"id":"E","next":["J"]},'
    '{"id":"J","next":["I"]},{"id":"I","next":["H"]},{"id":"F","next":["K"]},'
    '{"id":"K","next":["L"]},{"id":"H","next":["L"]},{"id":"L","next":["P"]},'
    '{"id":"P","next":["M","N"]},{"id":"M","next":[]},{"id":"N","next":[]}]';

class _FamilyTreeState extends State<FamilyTree> {
  var list = nodeInputFromJson(presetBasic);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(),
        Expanded(
          child: Zoom(
            width: 1800,
            height: 1800,
            child: DirectGraph(
              builder: (BuildContext, MatrixNode) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Member(),
                      ),
                    );
                  },
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://img.freepik.com/free-photo/mand-holding-cup_1258-340.jpg?size=626&ext=jpg"),
                  ),
                );
              },
              list: list,
              cellWidth: 136.0,
              cellPadding: 18.0,
              orientation: MatrixOrientation.Vertical,
            ),
          ),
        )
      ],
    );
  }
}
