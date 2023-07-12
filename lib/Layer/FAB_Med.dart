import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/DarkModeProvider.dart';
import '../Provider/Pasien_data.dart';
import 'package:intl/intl.dart';

class addRiwayat extends StatefulWidget {
  final String NamaText;
  const addRiwayat({Key? key, required this.NamaText}) : super(key: key);

  @override
  State<addRiwayat> createState() => _addRiwayatState();
}

class _addRiwayatState extends State<addRiwayat> {
  DateTime? _date;
  TextEditingController tBerkunjungController = TextEditingController();
  TextEditingController anamnesaController = TextEditingController();
  TextEditingController diagnosaController = TextEditingController();
  TextEditingController therapyController = TextEditingController();

  @override
  void dispose() {
    anamnesaController.dispose();
    diagnosaController.dispose();
    therapyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DataPasien>(context);
    return Consumer<DarkModeProvider>(
      builder: (context, darkModeProvider, _) {
        return GestureDetector(
          onTap: () {
            // Dismiss the keyboard when tapping outside the text fields
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Form Riwayat Pasien Baru",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new),
                color: Colors.black,
              ),
              backgroundColor: Color.fromRGBO(127, 218, 244, 100),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Tanggal Berkunjung",
                        style: TextStyle(
                            color: darkModeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    TextField(
                      controller: tBerkunjungController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            var res = await showDatePicker(
                              context: context,
                              initialDate: _date ?? DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2250),
                            );
                            if (res != null) {
                              setState(() {
                                _date = res;
                                tBerkunjungController.text =
                                    DateFormat('dd-MM-yyyy').format(_date!);
                              });
                            }
                          },
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async {
                        var res = await showDatePicker(
                          context: context,
                          initialDate: _date ?? DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2250),
                        );
                        if (res != null) {
                          setState(() {
                            _date = res;
                            tBerkunjungController.text =
                                DateFormat('dd-MM-yyyy').format(_date!);
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text("Anamnesa",
                          style: TextStyle(
                              color: darkModeProvider.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20)),
                    ),
                    TextField(
                      controller: anamnesaController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text("Diagnosa",
                          style: TextStyle(
                              color: darkModeProvider.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20)),
                    ),
                    TextField(
                      controller: diagnosaController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text("Therapy",
                          style: TextStyle(
                              color: darkModeProvider.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 20)),
                    ),
                    TextField(
                      controller: therapyController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            String tanggalBerkunjung =
                                tBerkunjungController.text.trim();
                            String anamnesa = anamnesaController.text.trim();
                            String diagnosa = diagnosaController.text.trim();
                            String therapy = therapyController.text.trim();

                            if (tanggalBerkunjung.isNotEmpty &&
                                anamnesa.isNotEmpty &&
                                diagnosa.isNotEmpty &&
                                therapy.isNotEmpty) {
                              prov.addMrecord(
                                tanggalBerkunjung,
                                anamnesa,
                                diagnosa,
                                therapy,
                                widget.NamaText,
                              );
                              Navigator.pop(context);
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Silahkan isi dulu formnya!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStateProperty.all<Size>(Size(120, 50)),
                          ),
                          child: Text("Done"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
