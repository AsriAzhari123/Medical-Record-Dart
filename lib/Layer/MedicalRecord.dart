// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/DarkModeProvider.dart';
import '../Provider/Pasien_data.dart';
import 'FAB_Med.dart';
import 'Temp_TabMed.dart';

class MyMedicalRecord extends StatefulWidget {
  final Map<String, dynamic> pasienData;

  const MyMedicalRecord({Key? key, required this.pasienData}) : super(key: key);

  @override
  State<MyMedicalRecord> createState() => _MyMedicalRecordState();
}

class _MyMedicalRecordState extends State<MyMedicalRecord> {
  String editedAllergyText = "";
  bool isEditing = false;
  late TextEditingController textEditingController1;

  @override
  void initState() {
    super.initState();
    textEditingController1 =
        TextEditingController(text: widget.pasienData['Alergi']);
  }

  @override
  void dispose() {
    textEditingController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String allergyText =
        isEditing ? editedAllergyText : widget.pasienData['Alergi'];
    String NamaText = widget.pasienData['Nama']!;
    String JenisKelaminText = widget.pasienData['JenisKelamin']!;
    String NomorTeleponText = widget.pasienData['NomorTelepon']!;
    String AlamatText = widget.pasienData['Alamat']!;
    String PekerjaanText = widget.pasienData['Pekerjaan']!;
    String ImunisasiText = widget.pasienData['Imunisasi']!;
    String TanggalLahirText = widget.pasienData['TanggalLahir']!;
    var prov = Provider.of<DataPasien>(context);
    return Consumer<DarkModeProvider>(builder: (context, darkModeProvider, _) {
      return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text(
            "MEDICAL RECORD PASIEN",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 137,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(202, 255, 160, 100),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 55,
                                        ),
                                        Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            Text(
                                              "${NamaText}\n",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "100000001",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 137,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(202, 255, 160, 100),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Data Pasien",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          TanggalLahirText,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          AlamatText,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          NomorTeleponText,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          JenisKelaminText,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          PekerjaanText,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${ImunisasiText} Imunisasi",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(47, 10, 47, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(202, 255, 160, 100),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: isEditing
                                        ? TextField(
                                            controller: textEditingController1,
                                            onChanged: (value) {
                                              setState(() {
                                                editedAllergyText = value;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          )
                                        : Text("Alergi : $allergyText"),
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (isEditing) {
                                          if (editedAllergyText.isNotEmpty) {
                                            widget.pasienData['Alergi'] =
                                                editedAllergyText;
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content:
                                                    Text('Data Alergi diubah!'),
                                              ),
                                            );
                                          }
                                          editedAllergyText = "";
                                        }
                                        isEditing = !isEditing;
                                      });
                                    },
                                    child: Text(isEditing ? "Save" : "Edit"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 12, 0, 12),
                          child: Text(
                            "Riwayat Pasien",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Center(
                                child: MyTabMed(pasienData: widget.pasienData),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => addRiwayat(
                NamaText: NamaText,
              ),
            ),
          ),
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
