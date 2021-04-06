import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.filter_list_alt,
            color: Colors.white,
            size: 28,
          ),
          Icon(
            Icons.swap_vert,
            color: Colors.white,
            size: 28,
          ),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.white,
            width: MediaQuery.of(context).size.width / 1.5,
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                labelText: "                                    البحث",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
