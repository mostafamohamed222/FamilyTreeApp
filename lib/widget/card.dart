import 'package:flutter/material.dart';

class CardCustome extends StatefulWidget {
  CardCustome({Key key}) : super(key: key);

  @override
  _CardCustomeState createState() => _CardCustomeState();
}

class _CardCustomeState extends State<CardCustome> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          "احمد حسن علي احمد",
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "مدينة جدة",
              style: TextStyle(color: Colors.brown),
            ),
            Text("60 عاما", style: TextStyle(color: Colors.brown)),
            Text("طبيب عام", style: TextStyle(color: Colors.brown)),
          ],
        ),
        trailing: Image(
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width / 4,
          image: NetworkImage(
              "https://img.freepik.com/free-photo/handsome-young-businessman-shirt-eyeglasses_85574-6228.jpg?size=626&ext=jpg"),
        ),
      ),
    );
  }
}
