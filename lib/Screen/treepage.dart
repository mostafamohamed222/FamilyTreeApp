import 'dart:math';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/models/membermodel.dart';
import 'package:treeapp/widget/loading.dart';
import 'member.dart';

class GraphViewPage extends StatefulWidget {
  @override
  _GraphViewPageState createState() => _GraphViewPageState();
}

class _GraphViewPageState extends State<GraphViewPage> {

  treeView(){
    Provider.of<MemberContorller>(context, listen: false).setType();
    return Builder (
      builder: (BuildContext) {
        if (Provider.of<MemberContorller>(context).isGetMemberLoading) {
          return Loading();
        } else {
          List<Node> nodes = [];
          graph = Graph();
          builder =  BuchheimWalkerConfiguration();

          for (var x in Provider.of<MemberContorller>(context, listen: false)
              .allMember) {
            Node n = Node(getNodeTextWithX(x));
            nodes.add(n);
            x.setNodeMember(nodes.length - 1);
          }

          for (var x in Provider.of<MemberContorller>(context, listen: false)
              .allMember) {
            print("this is sons for ${x.nodeNumber}");
            print("this is sons for ${x.id}");

            for (int i = 1; i < x.allsons.length; i++) {
              var v = x.allsons[i];
              print(v.id);
              print(v.nodeNumber);
              graph.addEdge(nodes[x.nodeNumber], nodes[v.nodeNumber]);
            }
          }
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Provider.of<MemberContorller>(context, listen: false)
                  .allMember
                  .length ==
                  1
                  ? InkWell(
                onDoubleTap: () {
                  Provider.of<MemberContorller>(context, listen: false)
                      .getMemberById(Provider.of<MemberContorller>(
                      context,
                      listen: false)
                      .allMember[0]
                      .id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Member(),
                    ),
                  );
                },
                onTap: () {
                  color = Colors.green;
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: color,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image(
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            Provider.of<MemberContorller>(context)
                                .allMember[0]
                                .image),
                      ),
                      Text(
                        Provider.of<MemberContorller>(context)
                            .allMember[0]
                            .name
                            .split(" ")[0],
                      )
                    ],
                  ),
                ),
              )
                  : Expanded(
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
                      ..color = Colors.black26
                      ..strokeWidth = 4
                      ..style = PaintingStyle.stroke,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 5),() {
      //treeView();
    });
    print("start tree");
    builder
      ..siblingSeparation = (65)
      ..levelSeparation = (100)
      ..subtreeSeparation = (100)
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
  }

  @override
  Widget build(BuildContext context) {
    print("start build");
    return Scaffold(
        body: SafeArea (
      child: treeView(),
    ));
  }

  Random r = Random();
  bool isSelected = false;
  int n = 1;
  Color color = Colors.black26;

  getNodeTextWithX(MemberModel x) {
    return InkWell(
      borderRadius: BorderRadius.circular(11),
      onDoubleTap: () {
        Provider.of<MemberContorller>(context, listen: false)
            .getMemberById(x.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Member(),
          ),
        );
      },
      onTap: () {
        color = Colors.green;
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: this.color,
          ),
        ),
        child: Column(
          children: [
            Image(
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              image: x.image.isEmpty||NetworkImage(x.image)==null?"لايوجد":NetworkImage(x.image),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                x.name.split(" ")[0],
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Graph graph = Graph();
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();
}
