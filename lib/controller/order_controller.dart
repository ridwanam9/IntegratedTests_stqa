import 'dart:io';

import 'package:http/http.dart' as http;

class OrderController {
  final String UrlAPI = 'http://10.0.2.2:8000/api';

  Future<bool?> storeOrder(String token, String menu_id, String jumlah,
      String total, String status, String user_id) async {
    final request = await http.post(
        Uri.parse(
          '$UrlAPI/order?menu_id=$menu_id&jumlah=$jumlah&total=$total&status=$status&user_id=$user_id',
        ),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (request.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> updateOrder(String token, String id, String menu_id,
      String jumlah, String status) async {
    final request = await http.put(
        Uri.parse(
          '$UrlAPI/order/$id?menu_id=$menu_id&jumlah=$jumlah&status=$status',
        ),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> deleteOrder(String token, String id) async {
    final request = await http.delete(Uri.parse('$UrlAPI/order/$id'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (request.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
