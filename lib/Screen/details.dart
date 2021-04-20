import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/member.dart';
import 'package:treeapp/models/memberContorller.dart';
import 'package:treeapp/models/membermodel.dart';

class Details extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    Provider.of<MemberContorller>(context, listen: false)
        .currentModel
        .printModel();
    return Container(
      child: ListView(
        children: [
          filed(
              filedTiltle: "المهنة",
              name: Provider.of<MemberContorller>(context, listen: false)
                  .currentModel
                  .job),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          filed(
              filedTiltle: "العمر ",
              name: "(" +
                  Provider.of<MemberContorller>(context, listen: false)
                      .currentModel
                      .alive +
                  ")      " +
                  Provider.of<MemberContorller>(context, listen: false)
                      .currentModel
                      .age),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          filed(
              filedTiltle: "المدينة",
              name: Provider.of<MemberContorller>(context, listen: false)
                  .currentModel
                  .city),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          filed(
              filedTiltle: "رقم الهاتف",
              name: Provider.of<MemberContorller>(context, listen: false)
                  .currentModel
                  .phone),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          filed(
              filedTiltle: "النوع",
              name: Provider.of<MemberContorller>(context, listen: false)
                  .currentModel
                  .gender),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

Widget filed({String name, String filedTiltle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    textDirection: TextDirection.rtl,
    children: [
      Text(
        filedTiltle,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      Text(name),
    ],
  );
}
