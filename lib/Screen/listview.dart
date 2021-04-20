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
    return Stack(
      children: [
        Column(
          children: [
            Search(),
            Expanded(
              child: scrollItem(),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          width: MediaQuery.of(context).size.width,
          height: Provider.of<MemberContorller>(context).stakcon == true
              ? MediaQuery.of(context).size.width
              : 0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
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
            itemCount: Provider.of<MemberContorller>(context).select.length,
            itemBuilder: (context, index) {
              return Container(
                child: CardCustome(
                  id: Provider.of<MemberContorller>(context).select[index].id,
                  age: Provider.of<MemberContorller>(context).select[index].age,
                  city:
                      Provider.of<MemberContorller>(context).select[index].city,
                  image: Provider.of<MemberContorller>(context)
                      .select[index]
                      .image,
                  job: Provider.of<MemberContorller>(context).select[index].job,
                  name:
                      Provider.of<MemberContorller>(context).select[index].name,
                ),
              );
            },
          );
        }
      },
    );
  }
}
