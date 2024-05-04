import 'package:flutter/material.dart';

class DataPasien extends ChangeNotifier {
  final Map<String, List<Map<String, dynamic>>> _datapasien = {
    "pasien": [
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
            "TanggalBerkunjung": "12 AprilNovember 2023",
            "Anamnesa": "Demam",
            "Diagnosa": "Ispa (Infeksi saluran pernapasan atas)",
            "Therapy":
                "Tensi 130/80mmhg, injeksi duradil 1ml, Tablet ciprofloxacin 50mg 2x1, Tablet dapirin 500mg 3x1, Tablet grantusif 3x1, Tablet lanadexon 2x1"
          },
          {
            "TanggalBerkunjung": "12 April 2023",
            "Anamnesa": "Demam12321",
            "Diagnosa": "Ispa (Infeksi saluran pernapasan atas)",
            "Therapy":
                "Tensi 130/80mmhg, injeksi duradil 1ml, Tablet ciprofloxacin 50mg 2x1, Tablet dapirin 500mg 3x1, Tablet grantusif 3x1, Tablet lanadexon 2x1"
          }
        ]
      },
      {
        "Nama": "Asri Azhari",
        "JenisKelamin": "Laki-Laki",
        "TanggalLahir": "31 Januari 2003",
        "NomorTelepon": "081263996565",
        "Alamat": "Jl. Mars",
        "Pekerjaan": "Mahasiswa",
        "Imunisasi": "Sudah",
        "Alergi": "Asap",
        "Mrecord": [
          {
            "TanggalBerkunjung": "24-08-2021",
            "Anamnesa": "Ulu hati terasa panas, mual kurang lebih 1 minggu",
            "Diagnosa": "Gastritis",
            "Therapy":
                "Sirup lambucid 3x1 sendok makan, Kapsul dobrizol X 1x1 sebelum makan, Tablet nufadon X 3x1"
          }
        ]
      },
      {
        "Nama": "Ahmad Heidy",
        "JenisKelamin": "Laki-Laki",
        "TanggalLahir": "12 Agustus 2003",
        "NomorTelepon": "081265545030",
        "Alamat": "Jl. Namex",
        "Pekerjaan": "Mahasiswa",
        "Imunisasi": "Sudah",
        "Alergi": "Bulu Anjing",
        "Mrecord": [
          {
            "TanggalBerkunjung": "12-12-2022",
            "Anamnesa": "Mencret",
            "Diagnosa": "Gastro entritis",
            "Therapy":
                "Kapsul dobrizol IV 1x1, Tablet anflat VI 3x1, Tablet molagit VIII 3x1, Tablet metrol VI 2x1"
          }
        ]
      },
      {
        "Nama": "William Diharjo",
        "JenisKelamin": "Laki-Laki",
        "TanggalLahir": "31 Februari 2003",
        "NomorTelepon": "081265545030",
        "Alamat": "Jl. Cipto",
        "Pekerjaan": "Mahasiswa",
        "Imunisasi": "Sudah",
        "Alergi": "Dihujat",
        "Mrecord": [
          {
            "TanggalBerkunjung": "09-03-2023",
            "Anamnesa": "Demam, Pilek, Batuk, sakit kurang lebih 4 hari",
            "Diagnosa": "Commoncold",
            "Therapy":
                "Kapsul cefixim 200mg X 2x1, Kapsul omberzol X 2x1, Tablet fasgo 500mg X 3x1, Tablet grantusif X 3x1"
          }
        ]
      },
      {
        "Nama": "Victor Yap",
        "JenisKelamin": "Laki-Laki",
        "TanggalLahir": "12 Agustus 2003",
        "NomorTelepon": "081265545030",
        "Alamat": "Jl. Namex",
        "Pekerjaan": "Mahasiswa",
        "Imunisasi": "Sudah",
        "Alergi": "Bulu Anjing",
        "Mrecord": [
          {
            "TanggalBerkunjung": "12 April 2023",
            "Anamnesa": "Demam2",
            "Diagnosa": "Ispa (Infeksi saluran pernapasan atas)",
            "Therapy":
                "Tensi 1302/80mmhg, injeksi duradil 1ml, Tablet ciprofloxacin 50mg 2x1, Tablet dapirin 500mg 3x1, Tablet grantusif 3x1, Tablet lanadexon 2x1"
          }
        ]
      },
      {
        "Nama": "Cavin Pardamean Sirait",
        "JenisKelamin": "Laki-Laki",
        "TanggalLahir": "12 Agustus 2003",
        "NomorTelepon": "081265545030",
        "Alamat": "Jl. Namex",
        "Pekerjaan": "Mahasiswa",
        "Imunisasi": "Sudah",
        "Alergi": "Bulu Anjing",
        "Mrecord": [
          {
            "TanggalBerkunjung": "12 April 2023",
            "Anamnesa": "Demam2",
            "Diagnosa": "Ispa (Infeksi saluran pernapasan atas)",
            "Therapy":
                "Tensi 1302/80mmhg, injeksi duradil 1ml, Tablet ciprofloxacin 50mg 2x1, Tablet dapirin 500mg 3x1, Tablet grantusif 3x1, Tablet lanadexon 2x1"
          }
        ]
      },
      {
        "Nama": "Su Novianti Suci Pratama",
        "JenisKelamin": "Perempuan",
        "TanggalLahir": "12 Agustus 2003",
        "NomorTelepon": "081265545030",
        "Alamat": "Jl. Namex",
        "Pekerjaan": "Mahasiswa",
        "Imunisasi": "Sudah",
        "Alergi": "Bulu Anjing",
        "Mrecord": [
          {
            "TanggalBerkunjung": "12 April 2023",
            "Anamnesa": "Demam2",
            "Diagnosa": "Ispa (Infeksi saluran pernapasan atas)",
            "Therapy":
                "Tensi 1302/80mmhg, injeksi duradil 1ml, Tablet ciprofloxacin 50mg 2x1, Tablet dapirin 500mg 3x1, Tablet grantusif 3x1, Tablet lanadexon 2x1"
          }
        ]
      },
      {
        "Nama": "Wendy",
        "JenisKelamin": "Laki-Laki",
        "TanggalLahir": "12 Agustus 2003",
        "NomorTelepon": "081265545030",
        "Alamat": "Jl. Namex",
        "Pekerjaan": "Mahasiswa",
        "Imunisasi": "Sudah",
        "Alergi": "Bulu Anjing",
        "Mrecord": [
          {
            "TanggalBerkunjung": "12 April 2023",
            "Anamnesa": "Demam2",
            "Diagnosa": "Ispa (Infeksi saluran pernapasan atas)",
            "Therapy":
                "Tensi 1302/80mmhg, injeksi duradil 1ml, Tablet ciprofloxacin 50mg 2x1, Tablet dapirin 500mg 3x1, Tablet grantusif 3x1, Tablet lanadexon 2x1"
          }
        ]
      },
    ],
  };
  get datapasien => _datapasien;
  var _ActivePasien;
  get activepasien => _ActivePasien;

  String? _TanggalBerkunjung;
  String? _Anamnesa;
  String? _Diagnosa;
  String? _Therapy;

  get tBerkunjung => _TanggalBerkunjung;
  get anamnesa => _Anamnesa;
  get diagnosa => _Diagnosa;
  get therapy => _Therapy;

  set settanggal(value) => _TanggalBerkunjung = value;
  set setanamnesa(value) => _Anamnesa = value;
  set setdiagnosa(value) => _Diagnosa = value;
  set settherapy(value) => _Therapy = value;

  void addMrecord(
    String TanggalBerkunjung,
    String Anamnesa,
    String Diagnosa,
    String Therapy,
    String namaText,
  ) {
    var index =
        _datapasien['pasien']!.indexWhere((data) => data['Nama'] == namaText);
    var data =
        _datapasien['pasien']![index]['Mrecord'] as List<Map<String, String>>;
    data.add({
      "TanggalBerkunjung": TanggalBerkunjung,
      "Anamnesa": Anamnesa,
      "Diagnosa": Diagnosa,
      "Therapy": Therapy,
    });

    notifyListeners();
  }

  Future addpasien(
    String Nama,
    String JenisKelamin,
    String TanggalLahir,
    String NomorTelepon,
    String Alamat,
    String Pekerjaan,
    String Imunisasi,
    String Alergi,
    String TanggalBerkunjung,
    String Anamnesa,
    String Diagnosa,
    String Therapy,
  ) async {
    var data = _datapasien['pasien'] as List<Map<String, dynamic>>;
    data.add({
      "Nama": Nama,
      "JenisKelamin": JenisKelamin,
      "TanggalLahir": TanggalLahir,
      "NomorTelepon": NomorTelepon,
      "Alamat": Alamat,
      "Pekerjaan": Pekerjaan,
      "Imunisasi": Imunisasi,
      "Alergi": Alergi,
    });
    notifyListeners();
  }

  void tambahPasien(
    String Nama,
    String JenisKelamin,
    String TanggalLahir,
    String NomorTelepon,
    String Alamat,
    String Pekerjaan,
    String Imunisasi,
    String Alergi,
    String TanggalBerkunjung,
    String Anamnesa,
    String Diagnosa,
    String Therapy,
  ) async {
    await addpasien(
      Nama,
      JenisKelamin,
      TanggalLahir,
      NomorTelepon,
      Alamat,
      Pekerjaan,
      Imunisasi,
      Alergi,
      TanggalBerkunjung,
      Anamnesa,
      Diagnosa,
      Therapy,
    );
    var index =
        _datapasien['pasien']!.indexWhere((data) => data['Nama'] == Nama);
    var data = _datapasien['pasien']![index];
    data.addAll({
      "Mrecord": [
        {
          "TanggalBerkunjung": TanggalBerkunjung,
          "Anamnesa": Anamnesa,
          "Diagnosa": Diagnosa,
          "Therapy": Therapy,
        }
      ]
    });
  }
}
