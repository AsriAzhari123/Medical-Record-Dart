import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  final _account = [
    {
      "NSIP": "123456789",
      "NamaLengkap": "Asri Azhari",
      "Email": "AsriAzhari@gmail.com",
      "KataSandi": "Pass123",
      "NoTelepon": "082162619002"
    }
  ];
  List get account => _account;
  var _Active;
  get active => _Active;
  void addaccount(String NSIP, String NamaLengkap, String Email,
      String KataSandi, String NoTelepon) {
    _account.add({
      "NSIP": NSIP,
      "NamaLengkap": NamaLengkap,
      "Email": Email,
      "KataSandi": KataSandi,
      "NoTelepon": NoTelepon
    });
    notifyListeners();
  }

  void useracctive(String NSIP, String NamaLengkap, String Email,
      String KataSandi, String NoTelepon) {
    _Active = {
      "NSIP": NSIP,
      "NamaLengkap": NamaLengkap,
      "Email": Email,
      "KataSandi": KataSandi,
      "NoTelepon": NoTelepon
    };
  }
}
