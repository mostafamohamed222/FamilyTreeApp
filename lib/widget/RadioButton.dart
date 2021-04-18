import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/models/memberContorller.dart';

class RadioButton extends StatefulWidget {
  RadioButton({Key key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return null;
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

Widget addRadioButtonForGender(int btnValue, String title) {
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
