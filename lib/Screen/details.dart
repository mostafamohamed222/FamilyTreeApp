import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeapp/Screen/update.dart';
import 'package:treeapp/models/memberContorller.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Center(
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Update(type:"first"),
                        ),
                      );
                    },
                    label: const Text('التعديل'),
                    icon: const Icon(Icons.edit),
                    backgroundColor: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Provider.of<MemberContorller>(context, listen: false).currentModel.job}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ': المهنة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "(" +
                      Provider.of<MemberContorller>(context, listen: false)
                          .currentModel
                          .alive +
                      ")      " +
                      Provider.of<MemberContorller>(context, listen: false)
                          .currentModel
                          .age,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ': العمر',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Provider.of<MemberContorller>(context, listen: false).currentModel.city}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ': المدينة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Provider.of<MemberContorller>(context, listen: false).currentModel.phone}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ': رقم الهاتف',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Divider(
              indent: 25,
              endIndent: 25,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Provider.of<MemberContorller>(context, listen: false).currentModel.gender}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ': النوع ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
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