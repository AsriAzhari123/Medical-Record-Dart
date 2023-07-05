import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
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
                                controller: TextEditingController(
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
                                controller: TextEditingController(
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
                          if (_formkey.currentState!.validate() == true) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Form Anda Diterima'),
                              backgroundColor: Colors.green,
                            ));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyFormPasien()));
                          }
                          ;
                        },
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerRight,
                          primary: Colors.green,
                          onPrimary: Colors.white,
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
