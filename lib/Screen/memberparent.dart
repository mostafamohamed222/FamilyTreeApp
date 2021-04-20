import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/widget/card.dart';

class MemberParents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<MemberContorller>(context).currentModel.parents);
    return Expanded(
      child: Provider.of<MemberContorller>(context)
                  .currentModel
                  .parents
                  .length ==
              1
          ? Center(child: Text("no parents"))
          : ListView.builder(
              itemBuilder: (BuildContext, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: MediaQuery.of(context).size.height * .12,
                  child: CardCustome(
                    age: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allparents[index + 1]
                        .age,
                    city: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allparents[index + 1]
                        .city,
                    image: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allparents[index + 1]
                        .image,
                    job: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allparents[index + 1]
                        .job,
                    name: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allparents[index + 1]
                        .name,
                    id: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allparents[index + 1]
                        .id,
                  ),
                );
              },
              itemCount: Provider.of<MemberContorller>(context, listen: false)
                      .currentModel
                      .parents
                      .length -
                  1,
            ),
    );
  }
}
