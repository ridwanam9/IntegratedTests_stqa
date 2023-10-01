class PasswordValidator {
  String? validatePassword(String? value) {
    int minLength = 8;
    String password = value!;
    bool _hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool _hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool _hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool _hasMinLength = password.length > minLength;

    if (_hasDigits & _hasUppercase & _hasLowercase & _hasMinLength) {
      return null;
    } else if (!_hasDigits) {
      return "Password harus mengandung angka";
    } else if (!_hasUppercase) {
      return "Password harus mengandung huruf besar";
    } else if (!_hasLowercase) {
      return "Password harus mengandung huruf kecil";
    } else if (!_hasMinLength) {
      return "Password harus lebih dari 8 karakter";
    } else
      return "Password tidak valid";
  }
}
