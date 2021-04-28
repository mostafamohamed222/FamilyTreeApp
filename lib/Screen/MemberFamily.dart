import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/add.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/widget/card.dart';

class MemberSons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<MemberContorller>(context).userNumber);

    return Provider.of<MemberContorller>(context).currentModel.sons.length ==
        1
        ? Center(
      child: Provider.of<MemberContorller>(context, listen: false)
          .userType ==
          "مستخدم"
          ? Center(
        child: Text("لا يوجد ابناء",  style: TextStyle(
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
                      type: "1",
                    ),
                  ),
                );
              },
              label: const Text('اضافة ابن'),
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
        ): Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Manager(
                        type: "1",
                      ),
                    ),
                  );
                },
                label: const Text('اضافة ابن'),
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
                height: MediaQuery.of(context).size.height * .12,
                child: CardCustome(
                  age: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allsons[index + 1]
                      .age,
                  city: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allsons[index + 1]
                      .city,
                  image: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allsons[index + 1]
                      .image,
                  job: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allsons[index + 1]
                      .job,
                  name: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allsons[index + 1].name.split(" ")[0],
                  id: Provider.of<MemberContorller>(context,
                      listen: false)
                      .currentModel
                      .allsons[index + 1]
                      .id,
                ),
              );
            },
            itemCount:
            Provider.of<MemberContorller>(context, listen: false)
                .currentModel
                .sons
                .length -
                1,
          ),
        ),
      ],
    );
  }
}