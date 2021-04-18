import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/add.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/models/membermodel.dart';
import 'package:treeapp/widget/card.dart';

class MemberSons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Provider.of<MemberContorller>(context)
                  .currentModel
                  .allsons
                  .length ==
              0
          ? Center(child: Text("no sons"))
          : Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Manager()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text("اضافة ابن"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext, index) {
                      MemberModel newMember =
                          Provider.of<MemberContorller>(context).retMemberById(
                              Provider.of<MemberContorller>(context)
                                  .currentModel
                                  .sons[index]);
                      print(newMember);
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.of(context).size.height * .12,
                        child: CardCustome(
                          age: "1",
                          city: Provider.of<MemberContorller>(context,
                                  listen: false)
                              .currentModel
                              .allsons[index]
                              .city,
                          image: Provider.of<MemberContorller>(context,
                                  listen: false)
                              .currentModel
                              .allsons[index]
                              .image,
                          job: Provider.of<MemberContorller>(context,
                                  listen: false)
                              .currentModel
                              .allsons[index]
                              .job,
                          name: Provider.of<MemberContorller>(context,
                                  listen: false)
                              .currentModel
                              .allsons[index]
                              .name,
                        ),
                      );
                    },
                    itemCount:
                        Provider.of<MemberContorller>(context, listen: false)
                            .currentModel
                            .allsons
                            .length,
                  ),
                ),
              ],
            ),
    );
  }
}
