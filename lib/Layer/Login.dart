import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rekapmedis/Layer/Home.dart';
import 'package:rekapmedis/Layer/Register.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
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
                padding: EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 20.0),
                child: Image.asset(
                  'images/profile.png',
                  width: 120,
                  height: 120,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Masuk",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 9,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        label: Text("NSIP : "),
                        counterText: '',
                        border: OutlineInputBorder())),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
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
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 47,
                    width: 193,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyHome()));
                      },
                      child: Text(
                        "Masuk",
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
                        "Belum Punya Akun ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyRegister()));
                        },
                        child: Text(
                          "Daftar",
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
