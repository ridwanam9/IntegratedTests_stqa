import 'package:finalproject/controller/username_controller.dart';
import 'package:finalproject/view/register.dart';

class UsernameValidator {
  String? validateUsername(String username) {
    final _isUppercase = RegExp(r'[A-Z]');
    int minLength = 5;
    if (username.isEmpty) {
      return 'Username tidak bolah kosong';
    } else if (username.length < minLength) {
      return 'Panjang minimal Username $minLength characters';
    } else if (username.contains(' ')) {
      return 'Username tidak boleh mengandung spasi';
    } else if (username.contains(_isUppercase)) {
      return 'Username tidak boleh mengandung huruf kapital/besar';
    } else {
      return null;
    }
  }
}
