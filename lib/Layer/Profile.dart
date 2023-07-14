import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rekapmedis/Layer/about.dart';
import '../Provider/DarkModeProvider.dart';
import '../Provider/user_data.dart';
import 'Login.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DataUser>(context);
    return Consumer<DarkModeProvider>(
      builder: (context, darkModeProvider, _) {
        return WillPopScope(
          onWillPop: () async => false, // Disable the back button
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
              ),
              backgroundColor: Color.fromRGBO(127, 218, 244, 100),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              color: darkModeProvider.isDarkMode ? Colors.black : Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  color: darkModeProvider.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  child: Image.asset(
                                    'images/bannerprofile.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 40.0,
                                  left: 20.0,
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 65,
                                      backgroundImage:
                                          AssetImage('images/profile.png'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${prov.userLogin['Nama']}",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: darkModeProvider.isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "${prov.userLogin['Email']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                      color: darkModeProvider.isDarkMode
                                          ? Colors.grey[300]
                                          : Color.fromARGB(255, 95, 95, 95),
                                    ),
                                  ),
                                  Text(
                                    "${prov.userLogin['NoTelepon']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: darkModeProvider.isDarkMode
                                          ? Colors.grey[300]
                                          : Color.fromARGB(255, 95, 95, 95),
                                    ),
                                  ),
                                  Text(
                                    "${prov.userLogin['NSIP']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: darkModeProvider.isDarkMode
                                          ? Colors.grey[300]
                                          : Color.fromARGB(255, 95, 95, 95),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "APP SETTING",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: darkModeProvider.isDarkMode
                                                ? Colors.white
                                                : Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.only(
                                              left: 0, right: 0),
                                          leading: Icon(
                                            Icons.dark_mode,
                                            color: darkModeProvider.isDarkMode
                                                ? Colors.grey[300]
                                                : Colors.black,
                                          ),
                                          title: Text(
                                            "Dark Mode",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: darkModeProvider.isDarkMode
                                                  ? Colors.grey[300]
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          trailing: Switch(
                                            value: darkModeProvider.isDarkMode,
                                            onChanged: (bool value) {
                                              darkModeProvider.toggleDarkMode();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: darkModeProvider.isDarkMode
                                        ? Colors.grey[700]
                                        : Color.fromARGB(255, 165, 165, 165),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "INFORMASI UMUM",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: darkModeProvider.isDarkMode
                                                ? Colors.white
                                                : Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.only(
                                              left: 0, right: 0),
                                          leading: Icon(
                                            Icons.info,
                                            color: darkModeProvider.isDarkMode
                                                ? Colors.grey[300]
                                                : Colors.black,
                                          ),
                                          title: Text(
                                            "Tentang Aplikasi",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: darkModeProvider.isDarkMode
                                                  ? Colors.grey[300]
                                                  : Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          trailing: Icon(
                                              Icons.arrow_forward_ios_rounded),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyAbout()),
                                            );
                                          },
                                        ),
                                        Divider(
                                          thickness: 2,
                                          color: darkModeProvider.isDarkMode
                                              ? Colors.grey[700]
                                              : Color.fromARGB(
                                                  255, 165, 165, 165),
                                        ),
                                        ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.only(
                                              left: 0, right: 0),
                                          leading: Icon(
                                            Icons.exit_to_app,
                                            color: darkModeProvider.isDarkMode
                                                ? Colors.grey[300]
                                                : Colors.black,
                                          ),
                                          title: Text(
                                            "Keluar",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: darkModeProvider.isDarkMode
                                                  ? Colors.grey[300]
                                                  : Colors.black,
                                            ),
                                          ),
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Konfirmasi"),
                                                  content: Text(
                                                      "Apakah Anda yakin ingin keluar?"),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: Text("Ya"),
                                                      onPressed: () {
                                                        Navigator
                                                            .pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      MyLogin()),
                                                          (route) => false,
                                                        );
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text("Tidak"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Divider(
                                          thickness: 2,
                                          color: darkModeProvider.isDarkMode
                                              ? Colors.grey[700]
                                              : Color.fromARGB(
                                                  255, 165, 165, 165),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
