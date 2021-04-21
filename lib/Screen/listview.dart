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
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width * .9,
            height: Provider.of<MemberContorller>(context).stakcon == true
                ? MediaQuery.of(context).size.width
                : 0,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                ExpansionTile(
                  title: Text("الترتيب"),
                  children: [
                    addRadioButtonForName(0, 'الاسم'),
                    addRadioButtonForName(1, 'العمر'),
                  ],
                ),
                ExpansionTile(
                  title: Text("نوع الترتيب"),
                  children: [
                    addRadioButtonForType(0, 'تصاعدي'),
                    addRadioButtonForType(1, 'تنازلي'),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width * .9,
            height: Provider.of<MemberContorller>(context).stakcon2 == true
                ? MediaQuery.of(context).size.height
                : 0,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ExpansionTile(
              title: Row(
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
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
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
            ),
          ),
        )
      ],
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

  scrollItem() {
    Provider.of<MemberContorller>(context, listen: false).setType();
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

  List name = ["الاسم", "العمر"];
  String namee;
  Row addRadioButtonForName(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: name[btnValue],
          groupValue: namee,
          onChanged: (value) {
            if (title == "الاسم") {
              Provider.of<MemberContorller>(context, listen: false)
                  .sortByName();
            } else {
              Provider.of<MemberContorller>(context, listen: false).sortByAge();
            }

            if (tyepp == "تنازلي") {
              Provider.of<MemberContorller>(context, listen: false).rev();
            }
            setState(() {
              print(value);
              namee = value;
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

  List tyep = ["تصاعدي", "تنازلي"];
  String tyepp;
  Row addRadioButtonForType(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: tyep[btnValue],
          groupValue: tyepp,
          onChanged: (value) {
            setState(() {
              print(value);
              tyepp = value;
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
