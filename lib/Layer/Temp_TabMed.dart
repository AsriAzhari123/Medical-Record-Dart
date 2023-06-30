import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Pasien_data.dart';

class MyTabMed extends StatefulWidget {
  const MyTabMed({Key? key});

  @override
  State<MyTabMed> createState() => _MyTabMedState();
}

class _MyTabMedState extends State<MyTabMed> {
  TextEditingController anamnesaController = TextEditingController();
  TextEditingController diagnosaController = TextEditingController();
  TextEditingController therapyController = TextEditingController();

  bool isEditingAnamnesa = false;
  bool isEditingDiagnosa = false;
  bool isEditingTherapy = false;

  String editedAnamnesaText = "";
  String editedDiagnosaText = "";
  String editedTherapyText = "";

  @override
  void dispose() {
    anamnesaController.dispose();
    diagnosaController.dispose();
    therapyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DataPasien providerDataPasien = Provider.of<DataPasien>(context);
    List<Map<String, String>> pasien = providerDataPasien.datapasien['pasien'];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: pasien.length,
        itemBuilder: (context, index) {
          String tanggalberkunjungText = pasien[index]['TanggalBerkunjung']!;
          String anamnesaText = pasien[index]['Anamnesa']!;
          String diagnosaText = pasien[index]['Diagnosa']!;
          String therapyText = pasien[index]['Therapy']!;

          return Container(
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(202, 255, 160, 100),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 18),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Text(
                              "Tanggal Masuk\n" + tanggalberkunjungText,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Container(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (isEditingAnamnesa ||
                                        isEditingDiagnosa ||
                                        isEditingTherapy) {
                                      // Save the changes
                                      if (isEditingAnamnesa) {
                                        if (editedAnamnesaText.isNotEmpty &&
                                            editedAnamnesaText !=
                                                anamnesaText) {
                                          pasien[index]['Anamnesa'] =
                                              editedAnamnesaText;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text('Data sudah terganti'),
                                          ));
                                        }
                                        editedAnamnesaText = "";
                                      }
                                      if (isEditingDiagnosa) {
                                        if (editedDiagnosaText.isNotEmpty &&
                                            editedDiagnosaText !=
                                                diagnosaText) {
                                          pasien[index]['Diagnosa'] =
                                              editedDiagnosaText;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text('Data sudah terganti'),
                                          ));
                                        }
                                        editedDiagnosaText = "";
                                      }
                                      if (isEditingTherapy) {
                                        if (editedTherapyText.isNotEmpty &&
                                            editedTherapyText != therapyText) {
                                          pasien[index]['Therapy'] =
                                              editedTherapyText;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text('Data Pasien diubah!'),
                                          ));
                                        }
                                        editedTherapyText = "";
                                      }
                                    }

                                    isEditingAnamnesa = !isEditingAnamnesa;
                                    isEditingDiagnosa = !isEditingDiagnosa;
                                    isEditingTherapy = !isEditingTherapy;
                                  });
                                },
                                child: Text(
                                  isEditingAnamnesa ||
                                          isEditingDiagnosa ||
                                          isEditingTherapy
                                      ? "Save"
                                      : "Edit",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 330,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        children: [
                                          Text("Anamnesa / Cek Fisik"),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: isEditingAnamnesa
                                              ? TextField(
                                                  controller:
                                                      anamnesaController,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      editedAnamnesaText =
                                                          value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                )
                                              : Text(
                                                  isEditingAnamnesa
                                                      ? editedAnamnesaText
                                                              .isNotEmpty
                                                          ? editedAnamnesaText
                                                          : anamnesaText ?? ''
                                                      : anamnesaText ?? '',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Container(
                                width: 330,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 16),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: [
                                            Text("Diagnosa"),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: isEditingDiagnosa
                                                ? TextField(
                                                    controller:
                                                        diagnosaController,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        editedDiagnosaText =
                                                            value;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  )
                                                : Text(
                                                    isEditingDiagnosa
                                                        ? editedDiagnosaText
                                                                .isNotEmpty
                                                            ? editedDiagnosaText
                                                            : diagnosaText ?? ''
                                                        : diagnosaText ?? '',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Container(
                                width: 330,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 16),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          children: [
                                            Text("Therapy"),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: isEditingTherapy
                                                ? TextField(
                                                    controller:
                                                        therapyController,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        editedTherapyText =
                                                            value;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  )
                                                : Text(
                                                    isEditingTherapy
                                                        ? editedTherapyText
                                                                .isNotEmpty
                                                            ? editedTherapyText
                                                            : therapyText ?? ''
                                                        : therapyText ?? '',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
