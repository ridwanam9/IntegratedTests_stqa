class TeleponValidator {
  String? validateTelepon(String notelp) {
    if (notelp.isEmpty) {
      return 'Telepon tidak boleh kosong';
    } else if (notelp.length < 10) {
      return 'Telepon tidak boleh kurang dari 10 digit';
    }
    return null;
  }
}
