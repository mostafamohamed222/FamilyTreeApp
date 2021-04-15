import 'dart:math';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/models/membermodel.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:provider/provider.dart';

import 'member.dart';

class GraphViewPage extends StatefulWidget {
  @override
  _GraphViewPageState createState() => _GraphViewPageState();
}

class _GraphViewPageState extends State<GraphViewPage> {
  @override
  Widget build(BuildContext context) {
    List<Node> nodes = [];

    for (var x
        in Provider.of<MemberContorller>(context, listen: false).allMember) {
      Node n = Node(getNodeTextWithX(x));
      nodes.add(n);
      x.setNodeMember(nodes.length - 1);
    }

    for (var x
        in Provider.of<MemberContorller>(context, listen: false).allMember) {
      print("this is sons for ${x.nodeNumber}");
      print("this is sons for ${x.id}");

      for (var i in x.allsons) {
        print(i.id);
        print(i.nodeNumber);
        graph.addEdge(nodes[x.nodeNumber], nodes[i.nodeNumber]);
      }
    }
    return Scaffold(
        body: SafeArea(
      child: Zoom(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Container(
                      alignment: AlignmentDirectional.center,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        ' شجرة العائلة ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.indigo),
                      )),
                ],
              ),
            ),
            Expanded(
              child: InteractiveViewer(
                  constrained: false,
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.01,
                  maxScale: 5.6,
                  child: GraphView(
                    graph: graph,
                    algorithm: BuchheimWalkerAlgorithm(
                        builder, TreeEdgeRenderer(builder)),
                    paint: Paint()
                      ..color = Colors.green
                      ..strokeWidth = 1
                      ..style = PaintingStyle.stroke,
                  )),
            ),
          ],
        ),
      ),
    ));
  }

  Random r = Random();

  int n = 1;

  getNodeTextWithX(MemberModel x) {
    return InkWell(
      onTap: () {
        Provider.of<MemberContorller>(context, listen: false)
            .getMemberById(x.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Member(),
          ),
        );
      },
      child: Column(
        children: [
          Image(
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width / 4,
            image: NetworkImage(x.image),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(x.name),
          )
        ],
      ),
    );
  }
  final Graph graph = Graph();
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
  
    builder
      ..siblingSeparation = (65)
      ..levelSeparation = (100)
      ..subtreeSeparation = (100)
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
  }
}
