import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/models/membermodel.dart';
import 'package:treeapp/widget/card.dart';

class MemberCouple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Provider.of<MemberContorller>(context)
                  .currentModel
                  .allcouples
                  .length ==
              0
          ? Center(child: Text("no couples"))
          : ListView.builder(
              itemBuilder: (BuildContext, index) {
                MemberModel newMember = Provider.of<MemberContorller>(context)
                    .retMemberById(Provider.of<MemberContorller>(context)
                        .currentModel
                        .couple[index]);
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: MediaQuery.of(context).size.height * .12,
                  child: CardCustome(
                    age: "1",
                    city: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allcouples[index]
                        .city,
                    image: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allcouples[index]
                        .image,
                    job: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allcouples[index]
                        .job,
                    name: Provider.of<MemberContorller>(context, listen: false)
                        .currentModel
                        .allcouples[index]
                        .name,
                  ),
                );
              },
              itemCount: Provider.of<MemberContorller>(context, listen: false)
                  .currentModel
                  .allcouples
                  .length,
            ),
    );
  }
}
