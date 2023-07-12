import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rekapmedis/Layer/Home.dart';

import '../Provider/DarkModeProvider.dart';
import '../Provider/Pasien_data.dart';

class MyFormPasien extends StatefulWidget {
  const MyFormPasien({Key? key}) : super(key: key);

  @override
  State<MyFormPasien> createState() => _MyFormPasienState();
}

class _MyFormPasienState extends State<MyFormPasien> {
  DateTime? _date;
  DateTime? _date2;
  bool formCompleted = false;
  String? selectedValue;
  String? dropdownError;

  final _formkey = GlobalKey<FormState>();
  String _selectedRadio = "";
  TextEditingController namaController = TextEditingController();
  TextEditingController? tLahirController;
  TextEditingController noTeleponController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController pekerjaanController = TextEditingController();
  TextEditingController? tBerkunjungController;
  TextEditingController alergiController = TextEditingController();
  TextEditingController anamnesaController = TextEditingController();
  TextEditingController diagnosaController = TextEditingController();
  TextEditingController therapyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tLahirController = TextEditingController();
    tBerkunjungController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DataPasien>(context);
    var brightness = Theme.of(context).brightness;
    var isDarkMode = brightness == Brightness.dark;

    return Consumer<DarkModeProvider>(builder: (context, darkModeProvider, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'PENDAFTARAN PASIEN',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(127, 218, 244, 100),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: namaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Nama Pasien';
                        }
                        return null;
                      },
                      maxLines: null,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Nama Pasien',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                    hint: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Jenis Kelamin",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    isExpanded: true,
                                    value: selectedValue,
                                    dropdownColor: Colors.white,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Text(
                                            "Laki-Laki",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        value: "Laki - Laki",
                                      ),
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Text(
                                            "Perempuan",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        value: "Perempuan",
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value!;
                                      });
                                    },
                                    validator: (value) {
                                      if (selectedValue == null) {
                                        return 'Mohon isi jenis kelamin anda';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Mohon isi tanggal lahir';
                                  }
                                  return null;
                                },
                                controller: tLahirController,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  labelText: 'Tanggal Lahir',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  filled: true,
                                  labelStyle: TextStyle(color: Colors.black),
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
                                      tLahirController!.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(_date!);
                                    });
                                  }
                                },
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
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
                                        tLahirController!.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(_date!);
                                      });
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: noTeleponController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Nomor Telepon';
                        }
                        return null;
                      },
                      maxLines: null,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'No Telepon',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: alamatController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Alamat anda';
                        }
                        return null;
                      },
                      maxLines: null,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Alamat',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: pekerjaanController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Pekerjaan anda';
                        }
                        return null;
                      },
                      maxLines: null,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Pekerjaan',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Imunisasi",
                            style: TextStyle(
                              fontSize: 14,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "Sudah",
                              groupValue: _selectedRadio,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRadio = value!;
                                });
                              },
                              activeColor: Colors.black,
                            ),
                            Text(
                              "Sudah",
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            Radio(
                              value: "Belum",
                              groupValue: _selectedRadio,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRadio = value!;
                                });
                              },
                              activeColor: Colors.black,
                            ),
                            Text(
                              "Belum",
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Mohon isi Tanggal Berkunjung ';
                                  }
                                  return null;
                                },
                                controller: tBerkunjungController,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  labelText: 'Tanggal Berkunjung',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  filled: true,
                                  labelStyle: TextStyle(color: Colors.black),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  var res = await showDatePicker(
                                    context: context,
                                    initialDate: _date2 ?? DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2250),
                                  );
                                  if (res != null) {
                                    setState(() {
                                      _date2 = res;
                                      tBerkunjungController!.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(_date2!);
                                    });
                                  }
                                },
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: IconButton(
                                  onPressed: () async {
                                    var res = await showDatePicker(
                                      context: context,
                                      initialDate: _date2 ?? DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2250),
                                    );
                                    if (res != null) {
                                      setState(() {
                                        _date2 = res;
                                        tBerkunjungController!.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(_date2!);
                                      });
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: alergiController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Alergi yang ada';
                        }
                        return null;
                      },
                      maxLines: null,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Alergi',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: anamnesaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Anamnesanya';
                        }
                        return null;
                      },
                      maxLines: null,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Anamnesa',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: diagnosaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Diagnosanya';
                        }
                        return null;
                      },
                      maxLines: null,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Diagnosa',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: therapyController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mohon isi Therapynya';
                        }
                        return null;
                      },
                      maxLines: null,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Therapy',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            String namaPasien = namaController.text.trim();
                            String tLahirPasien = tLahirController!.text.trim();
                            String noTeleponPasien =
                                noTeleponController.text.trim();
                            String alamatPasien = alamatController.text.trim();
                            String pekerjaanPasien =
                                pekerjaanController.text.trim();
                            String tBerkunjungPasien =
                                tBerkunjungController!.text.trim();
                            String alergiPasien = alergiController.text.trim();
                            String anamnesaPasien =
                                anamnesaController.text.trim();
                            String diagnosaPasien =
                                diagnosaController.text.trim();
                            String therapyPasien =
                                therapyController.text.trim();
                            prov.tambahPasien(
                              namaPasien,
                              selectedValue!,
                              tLahirPasien,
                              noTeleponPasien,
                              alamatPasien,
                              pekerjaanPasien,
                              _selectedRadio,
                              alergiPasien,
                              tBerkunjungPasien,
                              anamnesaPasien,
                              diagnosaPasien,
                              therapyPasien,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Form Anda Diterima'),
                              backgroundColor:
                                  Color.fromRGBO(127, 218, 244, 100),
                            ));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHome()),
                                (route) => false);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Harap isi semua field yang diperlukan'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          alignment: Alignment.centerRight,
                          elevation: 5,
                        ),
                        child: Text('Selesai'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
