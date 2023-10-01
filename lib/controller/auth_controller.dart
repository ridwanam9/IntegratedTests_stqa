import 'dart:convert';

import 'package:finalproject/model/auth_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  final String UrlAPI = 'http://10.0.2.2:8000/api';
  final String is_email = '@';
  final firebase = FirebaseFirestore.instance;

  Future<bool> login(String email, String password) async {
    if (email.contains(is_email)) {
      var result = await http.post(
          Uri.parse('${UrlAPI}/login?email=${email}&password=${password}'));
      if (result.statusCode == 201) {
        var data = json.decode(result.body);
        var authModel = AuthModel.fromMap(data);
        firebase.collection('token').doc(email).set({
          'token': authModel.access_token,
        });
        return true;
      } else {
        // throw Exception('Gagal Mengirim Data!');
        return false;
      }
    } else {
      var result = await http.post(
          Uri.parse('${UrlAPI}/login?username=${email}&password=${password}'));
      if (result.statusCode == 201) {
        var data = json.decode(result.body);
        AuthModel authModel = AuthModel.fromMap(data);
        firebase.collection('token').doc(email).set({
          'token': authModel.access_token,
        });
        return true;
      } else {
        // throw Exception('Gagal Mengirim Data!');
        return false;
      }
    }
  }

  Future<bool> logout(token) async {
    var result = await http.post(Uri.parse('${UrlAPI}/logout'),
        headers: {'Authorization': 'Bearer ${token}'});
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isAdmin(user) async {
    var result = await http.get(Uri.parse('${UrlAPI}/isadmin?user=${user}'));
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
