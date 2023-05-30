import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final bool obsecure;
  final String NAME;
  final IconData Logo;
  const MyInput(
      {super.key,
      required this.obsecure,
      required this.NAME,
      required this.Logo});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool check = false;
  @override
  void initState() {
    super.initState();
    check = widget.obsecure;
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
          obscureText: check,
          decoration: InputDecoration(
              label: Text(widget.NAME),
              prefixIcon: Icon(widget.Logo),
              suffixIcon: IconButton(
                icon: widget.NAME != "Kata sandi"
                    ? Container()
                    : Icon(check ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    check = !check;
                  });
                },
              ),
              border: OutlineInputBorder())),
    );
  }
}
