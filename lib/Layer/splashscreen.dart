import 'package:flutter/material.dart';
import 'dart:async';

import 'package:rekapmedis/Layer/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  int _currentPage = 0;
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        setState(() {
          _currentPage++;
        });
      } else {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyLogin()),
        );
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("REKAP MEDIS"),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Color.fromRGBO(127, 218, 244, 100),
          centerTitle: true),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return FadeTransition(
                opacity: _fadeInAnimation,
                child: Center(
                  child: SplashSliderItem(
                    imagePath: 'images/splash${index + 1}.jpg',
                    title: _getPageTitle(index),
                    fadeInAnimation: _fadeInAnimation,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      indicators.add(
        i == _currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Selamat Datang Di Aplikasi Rekap Medis';
      case 1:
        return 'Aplikasi Yang memudahkan \nAnda dalam mencatat data pasien';
      case 2:
        return 'Aplikasi yang memudahkan \nAnda untuk mencari riwayat pasien';
      default:
        return '';
    }
  }
}

class SplashSliderItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final Animation<double> fadeInAnimation;

  const SplashSliderItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.fadeInAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: fadeInAnimation,
              child: Image.asset(
                imagePath,
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 20),
            FadeTransition(
              opacity: fadeInAnimation,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
