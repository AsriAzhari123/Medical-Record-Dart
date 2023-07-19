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
        "NSIP": "000000000",
        "Nama": "User1",
        "Email": "User1@gmail.com",
        "KataSandi": "user1",
        "NoTelepon": "082100000000"
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
