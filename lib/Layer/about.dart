import 'package:flutter/material.dart';

class MyAbout extends StatelessWidget {
  const MyAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi',),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 224, 255, 200),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},

          )
        ],
        leading: BackButton(
          color: Colors.black,
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
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 50,),
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
              child: Image.asset('../assets/shutterstock_121866532-768x432.jpg',fit: BoxFit.fill,),
              
            ),
          ],
      ),
    );
  }
}