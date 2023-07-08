import 'package:flutter/material.dart';
import 'package:flutterhelp/main/tdataPasien.dart';
import 'package:flutterhelp/main/tdummyData.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyFormPasien extends StatefulWidget {
  const MyFormPasien({super.key});

  @override
  State<MyFormPasien> createState() => _MyFormPasienState();
}

class _MyFormPasienState extends State<MyFormPasien> {
  DateTime? _date;
  DateTime? _date2;
  bool formCompleted = false;
  // var _date = DateTime.now();
  String? selectedValue;
  String? dropdownError;

  final _formkey = GlobalKey<FormState>();
  String _SelectedRadio = "";
  TextEditingController namaController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  TextEditingController? tLahirController;
  TextEditingController noTeleponController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController pekerjaanController = TextEditingController();
  // TextEditingController imunisasiController = TextEditingController();
  TextEditingController? tBerkunjungController;
  TextEditingController alergiController = TextEditingController();
  TextEditingController anamnesaController = TextEditingController();
  TextEditingController diagnosaController = TextEditingController();
  TextEditingController therapyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DataPasien>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'FORM PENDAFTARAN PASIEN BARU',
          ),
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
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 224, 255, 200),
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
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Nama Pasien',
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
                                  color: Colors.white, // Background color
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  border: Border.all(
                                    color: Colors.black, // Border color
                                  ),

                                  // Border color
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField(
                                    hint: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Jenis Kelamin"),
                                    ),
                                    isExpanded: true,
                                    value: selectedValue,
                                    items: [
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  10), // Geser teks pilihan dropdown ke kiri
                                          child: Text("Laki-Laki"),
                                        ),
                                        value: "Laki - Laki",
                                      ),
                                      DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  10), // Geser teks pilihan dropdown ke kiri
                                          child: Text("Perempuan"),
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
                                controller: tLahirController =
                                    TextEditingController(
                                  text: _date != null
                                      ? DateFormat('yyyy-MM-dd').format(_date!)
                                      : '',
                                ),
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
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.date_range),
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
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'No Telepon',
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
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Alamat',
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
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        labelText: 'Pekerjaan',
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
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Row(children: [
                          Radio(
                            value: "Sudah",
                            groupValue: _SelectedRadio,
                            onChanged: (value) {
                              setState(() {
                                _SelectedRadio = value!;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                          Text("Sudah"),
                          Radio(
                            value: "Belum",
                            groupValue: _SelectedRadio,
                            onChanged: (value) {
                              setState(() {
                                _SelectedRadio = value!;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                          Text("Belum"),
                        ]),
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
                                controller: tBerkunjungController =
                                    TextEditingController(
                                  text: _date2 != null
                                      ? DateFormat('yyyy-MM-dd').format(_date2!)
                                      : '',
                                ),
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
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.date_range),
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
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Alergi',
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
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Anamnesa',
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
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Diagnosa',
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
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Therapy',
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
                          String therapyPasien = therapyController.text.trim();
                          prov.tambahPasien(
                            namaPasien,
                            selectedValue!,
                            tLahirPasien,
                            noTeleponPasien,
                            alamatPasien,
                            pekerjaanPasien,
                            _SelectedRadio,
                            alergiPasien,
                            tBerkunjungPasien,
                            anamnesaPasien,
                            diagnosaPasien,
                            therapyPasien,
                          );
                          // prov.addMrecord(tBerkunjungPasien, anamnesaPasien,
                          //     diagnosaPasien, therapyPasien, namaPasien);
                          if (_formkey.currentState!.validate() == true) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Form Anda Diterima'),
                              backgroundColor: Colors.green,
                            ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MytDataPasien()));
                          }
                          ;
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
        ));
  }
}
