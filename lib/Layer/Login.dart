import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rekapmedis/Layer/Home.dart';
import 'package:rekapmedis/Layer/Register.dart';
import 'package:rekapmedis/Layer/template_form.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  List<Map<String, dynamic>> form = [
    {"NAME": "NSIP", "ICON": Icons.person, "OBS": false},
    {"NAME": "Kata sandi", "ICON": Icons.lock, "OBS": true}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/profile.png',
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Masuk",
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
                      "Masuk",
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
                      "Belum Punya Akun ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyRegister()),
                        );
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
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
    );
  }
}
