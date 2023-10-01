import 'dart:convert';

import 'package:finalproject/model/username_model.dart';
import 'package:http/http.dart' as http;

class UsernameController {
  final String UrlAPI = 'http://10.0.2.2:8000/api';

  Future<bool> validateUsername(String username) async {
    final response =
        await http.get(Uri.parse('$UrlAPI/username/search?username=$username'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      var usernameModel = UsernameModel.fromMap(data);
      return true;
    } else {
      return false;
    }
  }
}
