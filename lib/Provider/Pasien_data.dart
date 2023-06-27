import 'package:flutter/material.dart';

class DataPasien extends ChangeNotifier {
  final _datapasien = {
    "pasien": [
      {
        "Nama": "Rangga Aprilla lubis",
        "JenisKelamin": "Laki-Laki",
        "TanggalLahir": "26 April 2003",
        "NomorTelepon": "082162619002",
        "Alamat": "Jl. Lembaga",
        "Pekerjaan": "Mahasiswa",
        "Imunisasi": "Sudah",
        "TanggalBerkunjung": "27 Juni 2023",
        "Alergi": "Ikan Laut",
      }
    ],
    "cekpasien": [
      {"Anamnesa": "Demam", "Diagnosa": "Ispa", "Therapy": "Panadol"}
    ]
  };
  get datapasien => _datapasien;
  var _ActivePasien;
  get activepasien => _ActivePasien;

  void addpasien(
      String Nama,
      String JenisKelamin,
      String TanggalLahir,
      String NomorTelepon,
      String Alamat,
      String Pekerjaan,
      String Imunisasi,
      String TanggalBerkunjung,
      String Alergi,
      String Anamnesa,
      String Diagnosa,
      String Therapy) {
    _datapasien.addAll({
      "pasien": [
        {
          "Nama": Nama,
          "JenisKelamin": JenisKelamin,
          "TanggalLahir": TanggalLahir,
          "NomorTelepon": NomorTelepon,
          "Alamat": Alamat,
          "Pekerjaan": Pekerjaan,
          "Imunisasi": Imunisasi,
          "TanggalBerkunjung": TanggalBerkunjung,
          "Alergi": Alergi,
        }
      ],
      "cekpasien": [
        {"Anamnesa": Anamnesa, "Diagnosa": Diagnosa, "Therapy": Therapy}
      ]
    });
    notifyListeners();
  }

  void pasienacctive(
      String Nama,
      String JenisKelamin,
      String TanggalLahir,
      String NomorTelepon,
      String Alamat,
      String Pekerjaan,
      String Imunisasi,
      String TanggalBerkunjung,
      String Alergi,
      String Anamnesa,
      String Diagnosa,
      String Therapy) {
    _ActivePasien = {
      "pasien": [
        {
          "Nama": Nama,
          "JenisKelamin": JenisKelamin,
          "TanggalLahir": TanggalLahir,
          "NomorTelepon": NomorTelepon,
          "Alamat": Alamat,
          "Pekerjaan": Pekerjaan,
          "Imunisasi": Imunisasi,
          "TanggalBerkunjung": TanggalBerkunjung,
          "Alergi": Alergi,
        }
      ],
      "cekpasien": [
        {"Anamnesa": Anamnesa, "Diagnosa": Diagnosa, "Therapy": Therapy}
      ]
    };
    notifyListeners();
  }
}
