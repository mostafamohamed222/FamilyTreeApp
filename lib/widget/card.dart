import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/member.dart';
import 'package:treeapp/models/memberContorller.dart';

class CardCustome extends StatefulWidget {
  final String name, image, job, city, id;
  final String age;

  CardCustome({this.age, this.city, this.image, this.job, this.name, this.id});

  @override
  _CardCustomeState createState() => _CardCustomeState();
}

class _CardCustomeState extends State<CardCustome> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Provider.of<MemberContorller>(context, listen: false)
              .getMemberById(widget.id);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Member(),
            ),
          );
        },
        title: Text(
          widget.name,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.city,
              style: TextStyle(color: Colors.brown),
            ),
            Text("${widget.age} عاما", style: TextStyle(color: Colors.brown)),
            Text(widget.job, style: TextStyle(color: Colors.brown)),
          ],
        ),
        trailing: Container(
          child: Image(
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width / 4,
            image: NetworkImage(widget.image),
          ),
        ),
      ),
    );
  }
}
