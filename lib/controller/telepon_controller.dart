import 'dart:convert';

import 'package:finalproject/model/telepon_model.dart';
import 'package:http/http.dart' as http;

class TeleponController {
  final String UrlAPI = 'http://10.0.2.2:8000/api';

  Future<bool> validateTelepon(String telepon) async {
    final response =
        await http.get(Uri.parse('$UrlAPI/telepon/search?telepon=$telepon'));
    if (response.statusCode == 200) {
      var teleponModel = TeleponModel.fromMap(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }
}
