import 'package:flutter/material.dart';
import 'package:user_list/models/user_model.dart';
import 'package:user_list/services/helper_services.dart';

class UserProvider with ChangeNotifier {
  List<User>? _userList;
  List<User>? get userList => _userList;

  Future<List<User>?> fetchUser() async {
    _userList = await HelperServices().getUserDetails();
    notifyListeners();
    return _userList;
  }
}
