import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Provider/user_data.dart';
import 'Login.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController NSIPController = TextEditingController();
  TextEditingController NamaLengkapController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController KataSandiController = TextEditingController();
  TextEditingController NoTeleponController = TextEditingController();
  bool isNSIPEmpty = false;
  bool isNamaLengkapEmpty = false;
  bool isEmailEmpty = false;
  bool isKataSandiEmpty = false;
  bool isNoTeleponEmpty = false;

  @override
  void dispose() {
    NSIPController.dispose();
    NamaLengkapController.dispose();
    EmailController.dispose();
    KataSandiController.dispose();
    NoTeleponController.dispose();
    super.dispose();
  }

  bool check = false;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DataUser>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Column(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(80, 80))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 22.0, 8.0, 1.0),
                      child: Image.asset(
                        'images/profile.png',
                        width: 140,
                        height: 110,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Container(
                        child: Text(
                          "PENDAFTARAN",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          controller: NSIPController,
                          decoration: InputDecoration(
                              labelText: "NSIP",
                              prefixIcon: Icon(Icons.person),
                              counterText: "",
                              errorText: isNSIPEmpty ? 'Harap isi NSIP' : null),
                          maxLength: 9,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              isNSIPEmpty = value.isEmpty;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          controller: NamaLengkapController,
                          decoration: InputDecoration(
                              labelText: "Nama Lengkap",
                              prefixIcon: Icon(Icons.person),
                              errorText: isNamaLengkapEmpty
                                  ? 'Harap isi Nama Lengkap'
                                  : null),
                          onChanged: (value) {
                            setState(() {
                              isNamaLengkapEmpty = value.isEmpty;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          controller: EmailController,
                          decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.mail),
                              errorText:
                                  isEmailEmpty ? 'Harap isi Email' : null),
                          onChanged: (value) {
                            setState(() {
                              isEmailEmpty = value.isEmpty;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          controller: KataSandiController,
                          obscureText: check,
                          decoration: InputDecoration(
                              labelText: "Kata Sandi",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      check = !check;
                                    });
                                  },
                                  icon: Icon(check
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              errorText: isKataSandiEmpty
                                  ? 'Harap isi Kata Sandi'
                                  : null),
                          onChanged: (value) {
                            setState(() {
                              isKataSandiEmpty = value.isEmpty;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          controller: NoTeleponController,
                          decoration: InputDecoration(
                              labelText: "Nomor Telepon",
                              counterText: "",
                              prefixIcon: Icon(Icons.phone),
                              errorText: isNoTeleponEmpty
                                  ? 'Harap isi Nomor Telepon'
                                  : null),
                          maxLength: 9,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              isNoTeleponEmpty = value.isEmpty;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 47,
                  width: 193,
                  child: ElevatedButton(
                    onPressed: () {
                      String NSIP = NSIPController.text.trim();
                      String Nama = NamaLengkapController.text.trim();
                      String Email = EmailController.text.trim();
                      String KataSandi = KataSandiController.text.trim();
                      String NoTelepon = NoTeleponController.text.trim();

                      setState(() {
                        isNSIPEmpty = NSIP.isEmpty;
                        isNamaLengkapEmpty = Nama.isEmpty;
                        isEmailEmpty = Email.isEmpty;
                        isKataSandiEmpty = KataSandi.isEmpty;
                        isNoTeleponEmpty = NoTelepon.isEmpty;
                      });

                      if (NSIP.isNotEmpty &&
                          Nama.isNotEmpty &&
                          Email.isNotEmpty &&
                          KataSandi.isNotEmpty &&
                          NoTelepon.isNotEmpty) {
                        prov.tambahuser(
                            NSIP, Nama, Email, KataSandi, NoTelepon);

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Pendaftaran Berhasil"),
                              content: Text("Akun anda sudah dibuat."),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyLogin(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
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
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
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
