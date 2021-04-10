import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'membermodel.dart';

class MemberContorller with ChangeNotifier {
  bool _isGetMemberLoading = false;
  bool get isGetMemberLoading => _isGetMemberLoading;

  List<MemberModel> _allMember = [];
  List<MemberModel> get allMember => _allMember;

  String id;
  MemberModel currentModel;

  final String url =
      "https://treeproject-4a712-default-rtdb.firebaseio.com/member.json";

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
            job: value['job']);
        _allMember.add(_newMeal);
      });
      _isGetMemberLoading = false;
      notifyListeners();
    } catch (e) {}
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
