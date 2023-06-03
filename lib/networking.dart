import 'dart:convert';
import 'dart:developer';
import 'package:assignment/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future getUsers() async {
    try {
      var url = Uri.parse(kUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List users = jsonDecode(response.body);
        return users;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
