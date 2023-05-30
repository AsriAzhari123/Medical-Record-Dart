import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  List _account = [
    {"NSIP": "adasdhasudh"}
  ];
  List get account => _account;

  set Register(val) {
    _account.add(val);
  }
}
