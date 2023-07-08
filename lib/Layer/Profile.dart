import 'package:flutter/material.dart';
import 'package:rekapmedis/Layer/about.dart';

import 'Home.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool dark = false;

  void toggleDarkMode() {
    setState(() {
      dark = !dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return MyHome();
            }));
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: dark
            ? Colors.black
            : Colors.white, // Set background color based on dark mode
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            color: dark
                                ? Colors.black
                                : Colors
                                    .white, // Set container color based on dark mode
                            child: Image.asset(
                              'images/bannerprofile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 65,
                              backgroundImage:
                                  Image.asset('images/profile.png').image,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Asri Azhari",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: dark
                                      ? Colors.white
                                      : Colors
                                          .black, // Set text color based on dark mode
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "asri.azhari@gmail.com",
                                style: TextStyle(
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                  color: dark
                                      ? Colors.grey[300]
                                      : Color.fromARGB(255, 95, 95,
                                          95), // Set text color based on dark mode
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "082145462497",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: dark
                                      ? Colors.grey[300]
                                      : Color.fromARGB(255, 95, 95,
                                          95), // Set text color based on dark mode
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "211111133",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: dark
                                      ? Colors.grey[300]
                                      : Color.fromARGB(255, 95, 95,
                                          95), // Set text color based on dark mode
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "APP SETTING",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 0, 0,
                                                0), // Set text color based on dark mode
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    dense: true,
                                    contentPadding:
                                        EdgeInsets.only(left: 0, right: 0),
                                    leading: Icon(
                                      Icons.dark_mode,
                                      color: dark
                                          ? Colors.grey[300]
                                          : Colors
                                              .black, // Set icon color based on dark mode
                                    ),
                                    title: Text(
                                      "Dark Mode",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: dark
                                            ? Colors.grey[300]
                                            : Colors
                                                .black, // Set text color based on dark mode
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Switch(
                                      value: dark,
                                      onChanged: (bool value) {
                                        setState(() {
                                          dark = value;
                                        });
                                      },
                                    ),
                                    onTap: toggleDarkMode,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                              color: dark
                                  ? Colors.grey[700]
                                  : Color.fromARGB(255, 165, 165,
                                      165), // Set divider color based on dark mode
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "INFORMASI UMUM",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: dark
                                            ? Colors.white
                                            : Color.fromARGB(255, 0, 0,
                                                0), // Set text color based on dark mode
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    dense: true,
                                    contentPadding:
                                        EdgeInsets.only(left: 0, right: 0),
                                    leading: Icon(
                                      Icons.info,
                                      color: dark
                                          ? Colors.grey[300]
                                          : Colors
                                              .black, // Set icon color based on dark mode
                                    ),
                                    title: Text(
                                      "Tentang Aplikasi",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: dark
                                            ? Colors.grey[300]
                                            : Colors
                                                .black, // Set text color based on dark mode
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyAbout()),
                                      );
                                    },
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: dark
                                        ? Colors.grey[700]
                                        : Color.fromARGB(255, 165, 165,
                                            165), // Set divider colorbased on dark mode
                                  ),
                                  ListTile(
                                      trailing:
                                          Icon(Icons.arrow_forward_ios_rounded),
                                      onTap: () {
                                        Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyProfile()),
                                        );
                                      },
                                      dense: true,
                                      contentPadding:
                                          EdgeInsets.only(left: 0, right: 0),
                                      leading: Icon(
                                        Icons.exit_to_app,
                                        color: dark
                                            ? Colors.grey[300]
                                            : Colors
                                                .black, // Set icon color based on dark mode
                                      ),
                                      title: Text(
                                        "Keluar",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: dark
                                              ? Colors.grey[300]
                                              : Colors
                                                  .black, // Set text color based on dark mode
                                        ),
                                      )),
                                  Divider(
                                    thickness: 2,
                                    color: dark
                                        ? Colors.grey[700]
                                        : Color.fromARGB(255, 165, 165,
                                            165), // Set divider color based on dark mode
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
    );
  }
}
