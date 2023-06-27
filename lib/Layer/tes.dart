import 'package:flutter/material.dart';

import 'FAB_Med.dart';
import 'Temp_TabMed.dart';

class MyMedicalRecord2 extends StatefulWidget {
  const MyMedicalRecord2({Key? key});

  @override
  State<MyMedicalRecord2> createState() => _MyMedicalRecord2State();
}

class _MyMedicalRecord2State extends State<MyMedicalRecord2> {
  String allergyText = "Udang Kepiting";
  String editedAllergyText = "";
  bool isEditing = false;
  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text(
            "MEDICAL RECORD PASIEN",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {},
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
                                      color:
                                          Color.fromRGBO(202, 255, 160, 100)),
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
                                              "Ahmad Heidy Hutagalung\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "100000001",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 137,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          Color.fromRGBO(202, 255, 160, 100)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Data Pasien",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          "1 Januari 2003",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Jl. Katamso",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "0812345678",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Laki-Laki",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Mahasiswa",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Sudah Imunisasi",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
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
                                color: Color.fromRGBO(202, 255, 160, 100)),
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
                                        : Text("Alergi : " +
                                            (isEditing
                                                ? editedAllergyText
                                                : allergyText)),
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (isEditing) {
                                          // Cek apakah ada perubahan pada teks
                                          if (editedAllergyText.isNotEmpty &&
                                              editedAllergyText !=
                                                  allergyText) {
                                            allergyText = editedAllergyText;
                                          }
                                          editedAllergyText =
                                              ""; // Mengosongkan teks yang diubah
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
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).viewInsets.bottom,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 12, 0, 12),
                          child: Text(
                            "Riwayat Pasien",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Center(
                                child: MyTabMed(),
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
        floatingActionButton: MyFABMed());
  }
}
