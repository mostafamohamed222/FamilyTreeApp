import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:treeapp/Screen/splashscreen.dart';
import 'membermodel.dart';

class MemberContorller with ChangeNotifier {
  bool _isGetMemberLoading = false;

  bool get isGetMemberLoading => _isGetMemberLoading;

  List<MemberModel> _allMember = [];

  List<MemberModel> get allMember => _allMember;

  List<MemberModel> select = [];

  bool _stakCon = false;

  bool get stakcon => _stakCon;

  bool _stakCon2 = false;

  bool get stakcon2 => _stakCon2;

  String userType;
  String userNumber;
  MemberModel user;

  void setType() {
    if (_allMember.length == 0) {
      userType = "مدير";
      user = MemberModel(name: "", image: "", phone: "");
      notifyListeners();
      return;
    }

    for (var x in _allMember) {
      if (x.phone == userNumber) {
        userType = x.type;
        user = x;
        notifyListeners();
        return;
      }
    }
    userType = "مستخدم";
    user = _allMember[0];
    notifyListeners();
  }

  bool checkNumber(String phone) {
    for (var x in _allMember) {
      if (x.phone == phone) {
        return true;
      }
    }
    return false;
  }

  void changeStak() {
    _stakCon = !_stakCon;
    _stakCon2 = false;
    notifyListeners();
  }

  void changeStak2() {
    _stakCon2 = !_stakCon2;
    _stakCon = false;
    notifyListeners();
  }

  void sortByName() {
    select.sort((a, b) {
      return a.name
          .toString()
          .toLowerCase()
          .compareTo(b.name.toString().toLowerCase());
    });

    notifyListeners();
  }

  void sortByAge() {
    select.sort((a, b) {
      return a.age.compareTo(b.age);
    });

    notifyListeners();
  }

  void rev() {
    var r = select;
    select = [];
    for (int i = r.length - 1; i >= 0; i--) {
      select.add(r[i]);
    }
    notifyListeners();
  }

  String id;
  MemberModel currentModel;
  Future<void> update(String id) async {
    var url = Uri.parse(
        'https://treeproject-4a712-default-rtdb.firebaseio.com/member/$id.json');

    MemberModel newMember = getById(id);

    await http.patch(
      url,
      body: json.encode(
        {
          "name": newMember.name,
          "dday": newMember.dday,
          "dmon": newMember.dmon,
          "dyear": newMember.dyear,
          "job": newMember.job,
          "image": newMember.image,
          "city": newMember.city,
          "email": newMember.email,
          "age": newMember.age,
          "phone": newMember.phone,
          "parent": newMember.parents,
          "son": newMember.sons,
          "couple": newMember.couple,
          "alive": newMember.alive,
        },
      ),
    );
  }

  var url = Uri.parse(
      'https://treeproject-4a712-default-rtdb.firebaseio.com/member.json');

  void addmember(
      {String firstName,
        String lastName,
        String imageUrl,
        String phone,
        String email,
        String city,
        String address,
        DateTime date,
        DateTime death,
        String gender,
        int role,
        bool alive,
        var parent,
        String type,
        String job}) {
    DateTime now = DateTime.now();
    String numberPhone = "$phone";

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
            "image": imageUrl,
            "city": city,
            "address": address,
            "gender": gender,
            "age": date==null?"غير معروف":(now.year - date.year).toString(),
            "phone": numberPhone,
            "email": email,
            "alive": alive == false ? "متوفي" : "حي",
            "parent": [parent, parent],
            "son": [parent],
            "couple": [parent],
            "dday":death==null?"غير معروف": death.day,
            "dmon":death==null?"غير معروف": death.month,
            "dyear": death==null?"غير معروف":death.year,
          },
        ),
      )
          .then((value) {
        MemberModel newMember = MemberModel(
            gender: gender,
            phone: numberPhone,
            type: role == 1 ? "مدير" : "مستخدم",
            alive: alive == false ? "متوفي" : "حي",
            id: json.decode(value.body)['name'],
            age: date==null?"غير معروف":(now.year - date.year).toString(),
            city: city,
            job: job,
            name: "$firstName $lastName ",
            parents: [parent, parent],
            couple: [parent],
            sons: [parent],
            image: imageUrl);
        if (newMember.parents != null) {
          for (var inelement in newMember.parents) {
            MemberModel newSon = getById(inelement);
            newMember.allparents.add(newSon);
          }
        }

        _allMember.add(newMember);
        searchByName("");
        //select.add(newMember);
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
    } else if (type == "2") {
      http
          .post(
        url,
        body: json.encode(
          {
            "name": "$firstName $lastName ",
            "type": role == 1 ? "مدير" : "مستخدم",
            "job": job,
            "image": imageUrl,
            "city": city,
            "address": address,
            "gender": gender,
            "age": date==null?"غير معروف":(now.year - date.year).toString(),
            "phone": numberPhone,
            "email": email,
            "alive": alive == false ? "متوفي" : "حي",
            "parent": [parent],
            "son": [parent],
            "couple": [parent, parent],
            "dday": death==null?"غير معروف":death.day,
            "dmon": death==null?"غير معروف":death.month,
            "dyear":death==null?"غير معروف": death.year,
          },
        ),
      )
          .then((value) {
        MemberModel newMember = MemberModel(
            type: role == 1 ? "مدير" : "مستخدم",
            alive: alive == false ? "متوفي" : "حي",
            id: json.decode(value.body)['name'],
            age: date==null?"غير معروف":(now.year - date.year).toString(),
            city: city,
            gender: gender,
            phone: numberPhone,
            job: job,
            name: "$firstName $lastName ",
            parents: [parent],
            couple: [parent, parent],
            sons: [parent],
            image: imageUrl);

        if (newMember.couple != null) {
          for (var inelement in newMember.couple) {
            MemberModel newSon = getById(inelement);
            newMember.allcouples.add(newSon);
          }
        }

        _allMember.add(newMember);
        searchByName("");
        // select.add(newMember);
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
    } else if (type == "3") {
      print(alive);
      http
          .post(
        url,
        body: json.encode(
          {
            "name": "$firstName $lastName ",
            "type": role == 1 ? "مدير" : "مستخدم",
            "job": job,
            "image": imageUrl,
            "city": city,
            "address": address,
            "gender": gender,
            "age": date==null?"غير معروف":(now.year - date.year).toString(),
            "phone": numberPhone,
            "email": email,
            "alive": alive == false ? "متوفي" : "حي",
            "parent": [""],
            "son": [""],
            "couple": [""],
            "dday":death==null?"غير معروف": death.day,
            "dmon": death==null?"غير معروف":death.month,
            "dyear":death==null?"غير معروف": death.year,
          },
        ),
      )
          .then((value) {
        MemberModel newMember = MemberModel(
            gender: gender,
            phone: numberPhone,
            type: role == 1 ? "مدير" : "مستخدم",
            alive: alive == false ? "متوفي" : "حي",
            id: json.decode(value.body)['name'],
            age: date==null?"غير معروف":(now.year - date.year).toString(),
            city: city,
            job: job,
            name: "$firstName $lastName ",
            parents: [""],
            couple: [""],
            sons: [""],
            image: imageUrl);
        _allMember.add(newMember);
        searchByName("");
        //select.add(newMember);
        notifyListeners();
        FirebaseAuth _auth = FirebaseAuth.instance;
        _auth.signOut();
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
            "image": imageUrl,
            "city": city,
            "address": address,
            "gender": gender,
            "age": date==null?"غير معروف":(now.year - date.year).toString(),
            "phone": numberPhone,
            "email": email,
            "alive": alive == false ? "متوفي" : "حي",
            "parent": [parent, parent],
            "son": [parent],
            "couple": [parent],
            "dday": death==null?"غير معروف":death.day,
            "dmon":death==null?"غير معروف": death.month,
            "dyear":death==null?"غير معروف": death.year,
          },
        ),
      )
          .then((value) {
        MemberModel newMember = MemberModel(
            type: role == 1 ? "مدير" : "مستخدم",
            alive: alive == false ? "متوفي" : "حي",
            id: json.decode(value.body)['name'],
            age:  date==null?"غير معروف":(now.year - date.year).toString(),
            city: city,
            gender: gender,
            phone: numberPhone,
            job: job,
            name: "$firstName $lastName ",
            parents: [parent],
            couple: [parent],
            sons: [parent, parent],
            image: imageUrl);

        if (newMember.sons != null) {
          for (var inelement in newMember.sons) {
            MemberModel newSon = getById(inelement);
            newMember.allsons.add(newSon);
          }
        }

        _allMember.add(newMember);
        //select.add(newMember);
        searchByName("");
        for (var x in _allMember) {
          if (x.id == parent) {
            x.parents.add(json.decode(value.body)['name']);
            x.allparents = [];
            if (x.parents != null) {
              for (var inelement in x.parents) {
                MemberModel newSon = getById(inelement);
                x.allparents.add(newSon);
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
      print(res.body.toString());
      print("we are here");
      if (res.body.toString() == "null") {
        print("we are here");
        _isGetMemberLoading = false;
        notifyListeners();
        print("we are here");
        return;
      } else {
        print("we are in else");
      }
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
          email: value['email'],
          add:value['address']
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

  int getNumberOfMela() {
    int ret = 0;
    for (var x in _allMember) {
      if (x.gender == "ذكر") {
        ret++;
      }
    }
    return ret;
  }

  int getNumberOfFemales() {
    int ret = 0;
    for (var x in _allMember) {
      if (x.gender == "انثي") {
        ret++;
      }
    }
    return ret;
  }
}

