import 'dart:convert';
import 'dart:io';

import '../model/menu_model.dart';
import 'package:http/http.dart' as http;

class MenuMakananController {
  final UrlAPI = "http://10.0.2.2:8000/api";

  Future<List<MenuModel>> getAllMenu(token) async {
    var result = await http.get(Uri.parse("${UrlAPI}/menu"),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

    if (result.statusCode == 200) {
      var data = json.decode(result.body);
      List<MenuModel> menu = [];
      for (var datas in data['data']) {
        MenuModel menuModel = MenuModel.fromMap(datas);
        menu.add(menuModel);
      }
      return menu;
    } else {
      throw Exception('Gagal mengambil data menu');
    }
  }
}
