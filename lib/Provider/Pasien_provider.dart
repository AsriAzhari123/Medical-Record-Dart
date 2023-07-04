import 'dart:convert';

import 'package:flutter/material.dart';

class PasienData extends ChangeNotifier {
  final _myPasien = [
    {
      "Pasien": [
        {
          "Nama": "Rangga Aprilla lubis",
          "JenisKelamin": "Laki-Laki",
          "TanggalLahir": "26 April 2003",
          "NomorTelepon": "082162619002",
          "Alamat": "Jl. Lembaga",
          "Pekerjaan": "Mahasiswa",
          "Imunisasi": "Sudah",
          "Alergi": "Ikan Laut",
          "Mrecord": [
            {
              "TanggalBerkunjung": "12 April 2023",
              "Anamnesa": "Demam",
              "Diagnosa": "Ispa (Infeksi saluran pernapasan atas)",
              "Therapy":
                  "Tensi 130/80mmhg, injeksi duradil 1ml, Tablet ciprofloxacin 50mg 2x1, Tablet dapirin 500mg 3x1, Tablet grantusif 3x1, Tablet lanadexon 2x1"
            }
          ]
        }
      ]
    }
  ];
  get myPasien {
    var tmp = json.encode(_myPasien);
    return json.decode(tmp);
  }
}
