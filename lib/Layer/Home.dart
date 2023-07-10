import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/DarkModeProvider.dart';
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
                      "User !",
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
                  CustomImageView(
                    imagePath: ImageConstant.imgBannerhome1,
                    height: getVerticalSize(169),
                    width: getHorizontalSize(360),
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
