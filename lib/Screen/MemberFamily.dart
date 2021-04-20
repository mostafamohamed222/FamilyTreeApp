import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/add.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/models/membermodel.dart';
import 'package:treeapp/widget/card.dart';

class MemberSons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<MemberContorller>(context).currentModel.sons);

    return Expanded(
      child: Provider.of<MemberContorller>(context).currentModel.sons.length ==
              1
          ? Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Manager(
                        type: "1",
                      ),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text("اضافة ابن"),
              ),
            )
          : Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Manager(
                          type: "1",
                        ),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Text("اضافة ابن"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: MediaQuery.of(context).size.height * .12,
                        child: CardCustome(
                          age: "1",
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
                              .allsons[index + 1]
                              .name,
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
            ),
    );
  }
}
