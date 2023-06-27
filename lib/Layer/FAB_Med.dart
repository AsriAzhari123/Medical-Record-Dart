import 'package:flutter/material.dart';

class MyFABMed extends StatefulWidget {
  const MyFABMed({super.key});

  @override
  State<MyFABMed> createState() => _MyFABMedState();
}

class _MyFABMedState extends State<MyFABMed> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }
}
