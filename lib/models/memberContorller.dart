import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'membermodel.dart';

class MemberContorller with ChangeNotifier {
  bool _isGetMemberLoading = false;
  bool get isGetMemberLoading => _isGetMemberLoading;

  List<MemberModel> _allMember = [];
  List<MemberModel> get allMember => _allMember;

  List<MemberModel> select = [];

  bool _stakCon = false;
  bool get stakcon => _stakCon;

  String userType;
  String userNumber;

  void setType() {
    for (var x in _allMember) {
      print(x.phone);
      print(userNumber);
      if (x.phone == userNumber) {
        userType = x.type;
        print("we find it");
        print(userType);
        notifyListeners();
        return;
      }
    }
    userType = "مستخدم";
    notifyListeners();
  }

  void changeStak() {
    _stakCon = !_stakCon;
    notifyListeners();
  }

  String id;
  MemberModel currentModel;
  Future<void> update(String id) async {
    var url = Uri.parse(
        'https://treeproject-4a712-default-rtdb.firebaseio.com/member/$id.json');

    MemberModel newMember = getById(id);

    await http.patch(url,
        body: json.encode({
          "name": newMember.name,
          "job": newMember.job,
          "image": newMember.image,
          "city": newMember.city,
          "age": newMember.age,
          "parent": newMember.parents,
          "son": newMember.sons,
          "couple": newMember.couple,
          "alive": newMember.alive,
        }));
  }

  var url = Uri.parse(
      'https://treeproject-4a712-default-rtdb.firebaseio.com/member.json');
  void addmember(
      {String firstName,
      String lastName,
      String phone,
      String email,
      String city,
      String address,
      DateTime date,
      String gender,
      int role,
      bool alive,
      String parent,
      String type,
      String job}) {
    DateTime now = DateTime.now();

    if (type == "1") {
      print(alive);
      http
          .post(
        url,
        body: json.encode(
          {
            "name": "$firstName $lastName ",
            "type": role == 1 ? "مدير" : "مستخدم",
            "job": job,
            "image":
                "https://media.gettyimages.com/photos/young-man-working-at-home-in-the-evening-picture-id1181035364?s=612x612",
            "city": city,
            "address": address,
            "gender": gender,
            "age": (now.year - date.year).toString(),
            "phone": phone,
            "email": email,
            "alive": alive == false ? "متوفي" : "حي",
            "parent": [parent, parent],
            "son": [parent],
            "couple": [parent],
          },
        ),
      )
          .then((value) {
        MemberModel newMember = MemberModel(
            gender: gender,
            phone: phone,
            type: type,
            alive: alive == false ? "متوفي" : "حي",
            id: json.decode(value.body)['name'],
            age: (now.year - date.year).toString(),
            city: city,
            job: role == 1 ? "مدير" : "مستخدم",
            name: "$firstName $lastName ",
            parents: [parent, parent],
            couple: [parent],
            sons: [parent],
            image:
                "https://media.gettyimages.com/photos/young-man-working-at-home-in-the-evening-picture-id1181035364?s=612x612");

        if (newMember.parents != null) {
          for (var inelement in newMember.parents) {
            MemberModel newSon = getById(inelement);
            newMember.allparents.add(newSon);
          }
        }

        _allMember.add(newMember);

        for (var x in _allMember) {
          if (x.id == parent) {
            x.sons.add(json.decode(value.body)['name']);
            x.allsons = [];
            if (x.sons != null) {
              for (var inelement in x.sons) {
                MemberModel newSon = getById(inelement);
                x.allsons.add(newSon);
              }
            }
            update(parent);
            notifyListeners();
          }
        }
      });
    } else {
      http
          .post(
        url,
        body: json.encode(
          {
            "name": "$firstName $lastName ",
            "type": role == 1 ? "مدير" : "مستخدم",
            "job": job,
            "image":
                "https://media.gettyimages.com/photos/young-man-working-at-home-in-the-evening-picture-id1181035364?s=612x612",
            "city": city,
            "address": address,
            "gender": gender,
            "age": (now.year - date.year).toString(),
            "phone": phone,
            "email": email,
            "alive": alive == false ? "متوفي" : "حي",
            "parent": [parent],
            "son": [parent],
            "couple": [parent, parent],
          },
        ),
      )
          .then((value) {
        MemberModel newMember = MemberModel(
            type: type,
            alive: alive == false ? "متوفي" : "حي",
            id: json.decode(value.body)['name'],
            age: (now.year - date.year).toString(),
            city: city,
            gender: gender,
            phone: phone,
            job: role == 1 ? "مدير" : "مستخدم",
            name: "$firstName $lastName ",
            parents: [parent],
            couple: [parent, parent],
            sons: [parent],
            image:
                "https://media.gettyimages.com/photos/young-man-working-at-home-in-the-evening-picture-id1181035364?s=612x612");

        if (newMember.couple != null) {
          for (var inelement in newMember.couple) {
            MemberModel newSon = getById(inelement);
            newMember.allcouples.add(newSon);
          }
        }

        _allMember.add(newMember);

        for (var x in _allMember) {
          if (x.id == parent) {
            x.couple.add(json.decode(value.body)['name']);
            x.allcouples = [];
            if (x.couple != null) {
              for (var inelement in x.couple) {
                MemberModel newSon = getById(inelement);
                x.allcouples.add(newSon);
              }
            }
            update(parent);
            notifyListeners();
          }
        }
      });
    }
  }

  Future<void> getMembersData() async {
    _isGetMemberLoading = true;
    notifyListeners();
    try {
      http.Response res = await http.get(url);
      final data = json.decode(res.body) as Map<String, dynamic>;
      data.forEach((key, value) {
        final MemberModel _newMeal = MemberModel(
          id: key,
          type: value['type'],
          image: value['image'],
          alive: value['alive'],
          name: value['name'],
          age: value['age'],
          city: value['city'],
          gender: value['gender'],
          job: value['job'],
          sons: value['son'],
          parents: value['parent'],
          couple: value['couple'],
          phone: value['phone'],
        );
        _allMember.add(_newMeal);
      });

      for (var element in _allMember) {
        if (element.sons != null) {
          for (var inelement in element.sons) {
            MemberModel newSon = getById(inelement);
            element.allsons.add(newSon);
          }
        }
      }

      for (var element in _allMember) {
        if (element.parents != null) {
          for (var inelement in element.parents) {
            MemberModel newSon = getById(inelement);
            element.allparents.add(newSon);
          }
        }
      }
      for (var element in _allMember) {
        if (element.couple != null) {
          for (var inelement in element.couple) {
            MemberModel newSon = getById(inelement);
            element.allcouples.add(newSon);
          }
        }
      }

      select = _allMember;
      _isGetMemberLoading = false;
      notifyListeners();
    } catch (e) {}
  }

  searchByName(String x) {
    select = [];
    notifyListeners();
    if (x == "") {
      select = _allMember;
      notifyListeners();
      return;
    }
    for (var a in _allMember) {
      if (a.name.contains(x)) {
        select.add(a);
      }
    }
    notifyListeners();
  }

  searchByCity(String city) {
    select = [];
    if (city == "") {
      select = _allMember;
    }
    for (var a in _allMember) {
      if (a.city.startsWith(city)) {
        select.add(a);
      }
    }
    notifyListeners();
  }

  searchByGender(String city) {
    select = [];
    if (city == "") {
      select = _allMember;
    }
    for (var a in _allMember) {
      if (a.gender.startsWith(city)) {
        select.add(a);
      }
    }
    notifyListeners();
  }

  MemberModel getById(String id) {
    for (var element in _allMember) {
      if (element.id == id) {
        return element;
      }
    }
    return null;
  }

  MemberModel retMemberById(String id) {
    _allMember.forEach((element) {
      if (element.id.startsWith(id)) {
        print(element.id.startsWith(id));
        return element;
      }
    });
    return null;
  }

  void getMemberById(String id) {
    _allMember.forEach((element) {
      if (element.id == id) {
        currentModel = element;
      }
    });
    return null;
  }
}
