import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          keyboardType: (widget.NAME == "NSIP" || widget.NAME == "No Telepon")
              ? TextInputType.number
              : TextInputType.text,
          inputFormatters:
              (widget.NAME == "NSIP" || widget.NAME == "No Telepon")
                  ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
                  : null,
          maxLength:
              (widget.NAME == "NSIP" || widget.NAME == "No telepon") ? 9 : null,
          decoration: InputDecoration(
              label: Text(widget.NAME),
              counterText: "",
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
