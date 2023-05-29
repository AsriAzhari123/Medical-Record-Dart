import 'package:flutter/material.dart';
import 'package:rekapmedis/Layer/Login.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  bool _isPasswordVisible = false;
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
              Padding(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 0),
                child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        label: Text("NSIP : "),
                        border: OutlineInputBorder())),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 0),
                child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        label: Text("Nama Lengkap : "),
                        border: OutlineInputBorder())),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 0),
                child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        label: Text("Email : "),
                        border: OutlineInputBorder())),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 0),
                child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                        label: Text("Kata Sandi : "),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder())),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 8),
                child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        label: Text("No Telepon : "),
                        border: OutlineInputBorder())),
              ),
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
