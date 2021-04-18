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

  String id;
  MemberModel currentModel;

  String url =
      'https://treeproject-4a712-default-rtdb.firebaseio.com/member.json';

  Future<void> getMembersData() async {
    _isGetMemberLoading = true;
    notifyListeners();
    try {
      http.Response res = await http.get(url);

      final data = json.decode(res.body) as Map<String, dynamic>;

      data.forEach((key, value) {
        final MemberModel _newMeal = MemberModel(
          id: key,
          image: value['image'],
          name: value['name'],
          age: value['age'],
          city: value['city'],
          gender: value['gender'],
          job: value['job'],
          sons: value['son'],
          parents: value['parent'],
          couple: value['couple'],
        );
        _allMember.add(_newMeal);
      });

      for (var element in _allMember) {
        if (element.sons != null) {
          for (var inelement in element.sons) {
            print(inelement);
            MemberModel newSon = getById(inelement);
            newSon.printModel();
            element.allsons.add(newSon);
          }
        }
      }

      for (var element in _allMember) {
        if (element.parents != null) {
          for (var inelement in element.parents) {
            print(inelement);
            MemberModel newSon = getById(inelement);
            newSon.printModel();
            element.allparents.add(newSon);
          }
        }
      }
      for (var element in _allMember) {
        if (element.couple != null) {
          for (var inelement in element.couple) {
            print(inelement);
            MemberModel newSon = getById(inelement);
            newSon.printModel();
            element.allcouples.add(newSon);
          }
        }
      }

      select = _allMember;
      print(select);
      _isGetMemberLoading = false;
      notifyListeners();
    } catch (e) {}
  }

  searchByName(String x) {
    select = [];
    notifyListeners();
    print(select);
    if (x == "") {
      select = _allMember;
    }
    for (var a in _allMember) {
      if (a.name.startsWith(x)) {
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
