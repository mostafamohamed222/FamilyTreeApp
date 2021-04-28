import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/add.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/widget/card.dart';

class MemberParents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<MemberContorller>(context)
        .currentModel
        .parents
        .length ==
        1
        ? Center(
      child: Provider.of<MemberContorller>(context, listen: false)
          .userType ==
          "مستخدم"
          ? Center(
        child: Text("لا يوجد اب/ام",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
      )
          : Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Manager(
                      type: "4",
                    ),
                  ),
                );
              },
              label: const Text('اضافة ام/اب'),
              icon: const Icon(Icons.add),
              backgroundColor: Colors.pink,
            ),
          ),
        ],
      ),
    )
        : Column(
      children: [
        Provider.of<MemberContorller>(context, listen: false)
            .userType ==
            "مستخدم"
            ? Center(
          child: Text(""),
        )
            : Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Manager(
                        type: "4",
                      ),
                    ),
                  );
                },
                label: const Text('اضافة اب/ام'),
                icon: const Icon(Icons.add),
                backgroundColor: Colors.pink,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: CardCustome(
                  age: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allparents[index + 1]
                      .age,
                  city: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allparents[index + 1]
                      .city,
                  image: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allparents[index + 1]
                      .image,
                  job: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allparents[index + 1]
                      .job,
                  name: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allparents[index + 1]
                      .name.split(" ")[0],
                  id: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allparents[index + 1]
                      .id,
                ),
              );
            },
            itemCount:
            Provider.of<MemberContorller>(context, listen: false)
                .currentModel
                .parents
                .length -
                1,
          ),
        ),
      ],
    );
  }
}