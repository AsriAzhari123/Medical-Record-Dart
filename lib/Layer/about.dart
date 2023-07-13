import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/DarkModeProvider.dart';

class MyAbout extends StatelessWidget {
  const MyAbout({super.key});

  @override
  Widget build(BuildContext context) {
    var darkModeProvider = Provider.of<DarkModeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang Aplikasi',
          style: TextStyle(
            color: Colors.black, // Set the title text color to black
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(127, 218, 244, 100),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Aplikasi Rekap Medis',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Yang dibuat bertujuan untuk mempermudah dokter dalam menangani data pasien',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 900,
            child: Image.asset(
              'images/BannerAbout.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      backgroundColor:
          darkModeProvider.isDarkMode ? Colors.black : Colors.white,
    );
  }
}
