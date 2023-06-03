import 'dart:developer';

import 'package:assignment/networking.dart';

import '../../models/user_model.dart';

ApiService apiService = ApiService();

class UserRepository {
  Future<List<User>> fetchUserList() async {
    final response = await apiService.getUsers();
    // log(response.toString());
    final List<dynamic> jsonList = response;
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
}
