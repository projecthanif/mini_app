import 'package:flutter/material.dart';
import 'package:mini_app/models/user_model.dart';
import 'package:mini_app/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  late List<UserModel> users = [];
  late UserModel? user = null;
  late bool loading = true;
  final UserService _userService = UserService();

  Future<void> getAllUsers() async {
    users = await _userService.getUsers();
    loading = false;
    notifyListeners();
  }

  Future<void> getUserById(int id) async {
    loading = true;
    user = await _userService.getUserById(id);
    notifyListeners();
    loading = false;
  }
}
