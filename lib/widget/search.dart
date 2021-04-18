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
      child: ExpansionTile(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "تم",
                      style: TextStyle(
                        color: Colors.yellow[500],
                      ),
                    ),
                    Text(
                      "تصفية",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.keyboard_arrow_up),
                  trailing: Text(
                    "المدينة",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          addRadioButtonForCity(0, 'جدة'),
                          addRadioButtonForCity(1, 'مكة'),
                          addRadioButtonForCity(2, 'رياض'),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.keyboard_arrow_up),
                  trailing: Text(
                    "الجنس",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          addRadioButtonForGender(0, "ذكر"),
                          addRadioButtonForGender(1, "انثي"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
        leading: Icon(
          Icons.filter_list_alt,
          color: Colors.white,
          size: 28,
        ),
        title: Icon(
          Icons.swap_vert,
          color: Colors.white,
          size: 28,
        ),
        trailing: Container(
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
      ),
    );
  }

  List city = ["جدة", "مكة", "رياض"];
  String cityy;
  Row addRadioButtonForCity(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: city[btnValue],
          groupValue: cityy,
          onChanged: (value) {
            Provider.of<MemberContorller>(context, listen: false)
                .searchByCity(value);
            setState(() {
              print(value);
              cityy = value;
            });
          },
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.brown),
        ),
      ],
    );
  }

  List gender = ["ذكر", "انثي"];
  String genderr;
  Row addRadioButtonForGender(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: genderr,
          onChanged: (value) {
            Provider.of<MemberContorller>(context, listen: false)
                .searchByGender(value);
            setState(() {
              print(value);
              genderr = value;
            });
          },
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.brown),
        ),
      ],
    );
  }
}
