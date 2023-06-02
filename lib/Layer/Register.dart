import 'package:flutter/material.dart';
import 'package:rekapmedis/Layer/Login.dart';
import 'package:rekapmedis/Layer/template_form.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  List form = [
    {"NAME": "NSIP", "ICON": Icons.person, "OBS": false},
    {"NAME": "Nama Lengkap", "ICON": Icons.person, "OBS": false},
    {"NAME": "Email", "ICON": Icons.email, "OBS": false},
    {"NAME": "Kata sandi", "ICON": Icons.person, "OBS": true},
    {"NAME": "No Telepon", "ICON": Icons.person, "OBS": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 5.0),
                child: Image.asset(
                  'images/profile.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Pendaftaran",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                  children: List.generate(
                      form.length,
                      (index) => MyInput(
                          obsecure: form[index]["OBS"],
                          NAME: form[index]["NAME"],
                          Logo: form[index]["ICON"]))),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 47,
                    width: 193,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(93, 189, 17, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 16,
                  child: Row(
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
                              MaterialPageRoute(
                                  builder: (context) => MyLogin()));
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                              color: Color.fromRGBO(41, 202, 225, 100)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
