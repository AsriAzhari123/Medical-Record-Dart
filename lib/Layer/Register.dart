// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rekapmedis/Layer/Home.dart';
import 'package:rekapmedis/Layer/Login.dart';
import 'package:rekapmedis/Layer/template_form.dart';
import 'package:rekapmedis/Provider/user_provider.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  List<Map<String, dynamic>> form = [
    {"NAME": "NSIP", "ICON": Icons.person, "OBS": false},
    {"NAME": "Nama Lengkap", "ICON": Icons.person, "OBS": false},
    {"NAME": "Email", "ICON": Icons.email, "OBS": false},
    {"NAME": "Kata sandi", "ICON": Icons.person, "OBS": true},
    {"NAME": "No Telepon", "ICON": Icons.person, "OBS": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/profile.png',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Pendaftaran",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    children: form
                        .map((item) => MyInput(
                              obsecure: item["OBS"],
                              NAME: item["NAME"],
                              Logo: item["ICON"],
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    height: 47,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHome()),
                        );
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(93, 189, 17, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah Punya Akun ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyLogin()),
                          );
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
