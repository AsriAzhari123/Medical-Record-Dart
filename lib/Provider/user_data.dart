import 'package:flutter/material.dart';

class DataUser extends ChangeNotifier {
  final _datauser = {
    "user": [
      {
        "NSIP": "123456789",
        "Nama": "Haris Lubis",
        "Email": "haris@gmail.com",
        "KataSandi": "Haris123",
        "NoTelepon": "082162619000"
      },
      {
        "NSIP": "134567891",
        "Nama": "Rangga Lubis",
        "Email": "Rangga@gmail.com",
        "KataSandi": "rangga123",
        "NoTelepon": "082162619002"
      },
    ]
  };
  get datauser => _datauser;

  var userLogin;

  bool login(String NSIP, String KataSandi) {
    var dataUser = (_datauser['user'] as List<Map<String, String>>).singleWhere(
        (user) => user['NSIP'] == NSIP && user['KataSandi'] == KataSandi);
    userLogin = dataUser;
    notifyListeners();
    return dataUser.isNotEmpty;
  }

  void tambahuser(
    String NSIP,
    String Nama,
    String Email,
    String KataSandi,
    String NoTelepon,
  ) async {
    var data = _datauser['user'] as List<Map<String, String>>;
    data.add({
      "NSIP": NSIP,
      "Nama": Nama,
      "Email": Email,
      "KataSandi": KataSandi,
      "NoTelepon": NoTelepon
    });
    notifyListeners();
  }
}
