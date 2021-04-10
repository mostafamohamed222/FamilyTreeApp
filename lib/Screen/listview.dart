import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/widget/card.dart';
import 'package:treeapp/widget/loading.dart';
import 'package:treeapp/widget/search.dart';

class FamilyList extends StatefulWidget {
  FamilyList({Key key}) : super(key: key);

  @override
  _FamilyListState createState() => _FamilyListState();
}

class _FamilyListState extends State<FamilyList> {
  @override
  void initState() {
    if (Provider.of<MemberContorller>(context, listen: false)
            .allMember
            .length ==
        0) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          Provider.of<MemberContorller>(context, listen: false)
              .getMembersData();
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Search(),
        Expanded(
          child: scrollItem(),
        ),
      ],
    );
  }

  scrollItem() {
    return Builder(
      builder: (BuildContext) {
        if (Provider.of<MemberContorller>(context).isGetMemberLoading) {
          return Loading();
        } else {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: Provider.of<MemberContorller>(context).allMember.length,
            itemBuilder: (context, index) {
              return Container(
                child: CardCustome(
                  id: Provider.of<MemberContorller>(context)
                      .allMember[index]
                      .id,
                  age: Provider.of<MemberContorller>(context)
                      .allMember[index]
                      .age,
                  city: Provider.of<MemberContorller>(context)
                      .allMember[index]
                      .city,
                  image: Provider.of<MemberContorller>(context)
                      .allMember[index]
                      .image,
                  job: Provider.of<MemberContorller>(context)
                      .allMember[index]
                      .job,
                  name: Provider.of<MemberContorller>(context)
                      .allMember[index]
                      .name,
                ),
              );
            },
          );
        }
      },
    );
  }
}
