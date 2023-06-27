import 'package:flutter/material.dart';

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

  String anamnesaText = "Demam, Batuk, Pilek, Sudah selama 2 hari";
  String diagnosaText = "Ispa (Infeksi saluran pernapasan atas)";
  String therapyText =
      "Tensi 130/80mmhg, injeksi duradil 1ml, Tablet ciprofloxacin 50mg 2x1, Tablet dapirin 500mg 3x1, Tablet grantusif 3x1, Tablet lanadexon 2x1";

  @override
  void dispose() {
    anamnesaController.dispose();
    diagnosaController.dispose();
    therapyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(202, 255, 160, 100)),
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
                        "Tanggal Masuk\n 12 April 2023",
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
                                  if (editedAnamnesaText.isNotEmpty) {
                                    anamnesaText = editedAnamnesaText;
                                  }
                                  editedAnamnesaText = "";
                                }
                                if (isEditingDiagnosa) {
                                  if (editedDiagnosaText.isNotEmpty) {
                                    diagnosaText = editedDiagnosaText;
                                  }
                                  editedDiagnosaText = "";
                                }
                                if (isEditingTherapy) {
                                  if (editedTherapyText.isNotEmpty) {
                                    therapyText = editedTherapyText;
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
            Row(
              children: [
                Container(
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
                                      controller: anamnesaController,
                                      onChanged: (value) {
                                        setState(() {
                                          editedAnamnesaText = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    )
                                  : Text(
                                      isEditingAnamnesa
                                          ? editedAnamnesaText.isNotEmpty
                                              ? editedAnamnesaText
                                              : anamnesaText
                                          : anamnesaText,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
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
                                Text("Diagnosa"),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: isEditingDiagnosa
                                    ? TextField(
                                        controller: diagnosaController,
                                        onChanged: (value) {
                                          setState(() {
                                            editedDiagnosaText = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      )
                                    : Text(
                                        isEditingDiagnosa
                                            ? editedDiagnosaText.isNotEmpty
                                                ? editedDiagnosaText
                                                : diagnosaText
                                            : diagnosaText,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
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
                                Text("Therapy"),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: isEditingTherapy
                                    ? TextField(
                                        controller: therapyController,
                                        onChanged: (value) {
                                          setState(() {
                                            editedTherapyText = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      )
                                    : Text(
                                        isEditingTherapy
                                            ? editedTherapyText.isNotEmpty
                                                ? editedTherapyText
                                                : therapyText
                                            : therapyText,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    );
  }
}
