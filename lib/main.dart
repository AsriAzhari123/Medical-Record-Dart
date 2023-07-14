// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rekapmedis/Layer/DataPasien.dart';
import 'package:rekapmedis/Layer/FormPasien.dart';
import 'package:rekapmedis/Layer/Login.dart';
import 'package:rekapmedis/Layer/MedicalRecord.dart';
import 'package:rekapmedis/Layer/Register.dart';
import 'package:rekapmedis/Layer/splashscreen.dart';
import 'package:rekapmedis/Provider/user_provider.dart';

import 'Layer/Profile.dart';
import 'Provider/DarkModeProvider.dart';
import 'Provider/Pasien_data.dart';
import 'Provider/user_data.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => DataPasien(),
    ),
    ChangeNotifierProvider(
      create: (_) => DataUser(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DarkModeProvider>(
      create: (_) => DarkModeProvider(),
      child: Consumer<DarkModeProvider>(
        builder: (context, darkModeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: darkModeProvider.isDarkMode
                ? ThemeData.dark()
                : ThemeData.light(),
            home: SplashScreen(), // Ubah MyLogin() menjadi SplashScreen()
          );
        },
      ),
    );
  }
}
