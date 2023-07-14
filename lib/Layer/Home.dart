// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import '../Provider/DarkModeProvider.dart';
import '../Provider/user_data.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../widgets/app_bar/appbar_image.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_image_view.dart';
import 'DataPasien.dart';
import 'FormPasien.dart';
import 'Profile.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DataUser>(context);
    return Consumer<DarkModeProvider>(
      builder: (context, darkModeProvider, _) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: darkModeProvider.isDarkMode
                ? Colors.black
                : ColorConstant.gray100,
            appBar: CustomAppBar(
              height: getVerticalSize(109),
              title: Container(
                width: getHorizontalSize(160),
                margin: getMargin(left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 1.5, // Faktor skala yang diinginkan
                      child: Align(
                        alignment: Alignment.centerLeft, // Posisi ke kiri
                        child: DigitalClock(
                          is24HourTimeFormat: false,
                          showSecondsDigit: false,
                        ),
                      ),
                    ),
                    Text(
                      "Hi,",
                      style: TextStyle(
                        color: darkModeProvider.isDarkMode
                            ? Colors.white
                            : ColorConstant.black900,
                        fontSize: getFontSize(23),
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "${prov.userLogin['Nama']}",
                      style: TextStyle(
                        color: darkModeProvider.isDarkMode
                            ? Colors.white
                            : ColorConstant.black900,
                        fontSize: getFontSize(23),
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Bagaimana Kabarmu?",
                      style: TextStyle(
                        color: darkModeProvider.isDarkMode
                            ? Colors.grey[400]
                            : ColorConstant.blueGray400,
                        fontSize: getFontSize(16),
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                AppbarImage(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProfile(),
                      ),
                    );
                  },
                  height: getVerticalSize(50),
                  width: getHorizontalSize(49),
                  imagePath: ImageConstant.imgProfileimg1,
                  margin: getMargin(left: 41, top: 9, right: 41, bottom: 14),
                ),
              ],
            ),
            body: Container(
              padding: getPadding(top: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.easeInOut,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        // setState(() {
                        //   _current = index;
                        // });
                      },
                    ),
                    items: [
                      Image.asset(
                        'images/BannefHome.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'images/dokter.jpg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'images/obatpil.jpg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: getMargin(left: 5, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: i,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: getPadding(left: 32, top: 21),
                    child: Text(
                      "Fitur",
                      style: TextStyle(
                        color: darkModeProvider.isDarkMode
                            ? Colors.white
                            : ColorConstant.black900,
                        fontSize: getFontSize(23),
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 29, top: 21, bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyFormPasien(),
                                  ),
                                );
                              },
                              child: CustomImageView(
                                imagePath: ImageConstant.imgPngwing2,
                                height: getSize(62),
                                width: getSize(62),
                              ),
                            ),
                            Container(
                              width: getHorizontalSize(90),
                              margin: getMargin(top: 11),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyFormPasien(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Tambah Pasien Baru",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: darkModeProvider.isDarkMode
                                        ? Colors.white
                                        : ColorConstant.black900,
                                    fontSize: getFontSize(18),
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: getPadding(left: 42, bottom: 17),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MytDataPasien(),
                                    ),
                                  );
                                },
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgPngwing3,
                                  height: getSize(62),
                                  width: getSize(62),
                                ),
                              ),
                              Container(
                                width: getHorizontalSize(90),
                                margin: getMargin(top: 11),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MytDataPasien(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Data Pasien",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: darkModeProvider.isDarkMode
                                          ? Colors.white
                                          : ColorConstant.black900,
                                      fontSize: getFontSize(18),
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
