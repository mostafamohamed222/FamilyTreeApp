import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/memberContorller.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _numberTextController = TextEditingController();

  List<String> listItems = ["مكة", "جدة"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            child: InkWell(
              onTap: () {
                print("tapped");
                Provider.of<MemberContorller>(context, listen: false)
                    .changeStak2();
              },
              child: Icon(
                Icons.filter_list_alt,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          Container(
            width: 50,
            child: InkWell(
              onTap: () {
                Provider.of<MemberContorller>(context, listen: false)
                    .changeStak();
              },
              child: Icon(
                Icons.swap_vert,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            width: MediaQuery.of(context).size.width / 1.5,
            height: 30,
            child: TextField(
              onSubmitted: (String value) {
                print(_numberTextController.text);
                Provider.of<MemberContorller>(context, listen: false)
                    .searchByName(_numberTextController.text);
              },
              controller: _numberTextController,
              decoration: InputDecoration(
                labelText: "                                    البحث",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
