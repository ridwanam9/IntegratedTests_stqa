import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/email_model.dart';

class EmailController {
  final String UrlAPI = 'http://10.0.2.2:8000/api';

  Future<bool> validateEmail(String email) async {
    final response =
        await http.get(Uri.parse('$UrlAPI/email/search?email=$email'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var emailModel = EmailModel.fromMap(data);
      return true;
    } else {
      return false;
    }
  }
}
