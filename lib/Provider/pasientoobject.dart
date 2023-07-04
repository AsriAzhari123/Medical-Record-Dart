class Person {
  String? Nama;
  String? JenisKelamin;
  String? TanggalLahir;
  int? NomorTelepon;
  String? Alamat;
  String? Pekerjaan;
  String? Imunisasi;
  String? Alergi;
  List<mrecord>? Mrecord;

  Person({
    this.Nama,
    this.JenisKelamin,
    this.TanggalLahir,
    this.NomorTelepon,
    this.Alamat,
    this.Pekerjaan,
    this.Imunisasi,
    this.Alergi,
    this.Mrecord,
  });

  Person.fromJson(Map<String, dynamic> json) {
    Nama = json['Nama'];
    JenisKelamin = json['JenisKelamin'];
    TanggalLahir = json['TanggalLahir'];
    NomorTelepon = json['NomorTelepon'];
    Alamat = json['Alamat'];
    Pekerjaan = json['Pekerjaan'];
    Imunisasi = json['Imunisasi'];
    Alergi = json['Alergi'];
    if (json['Mrecord'] != null) {
      Mrecord = <mrecord>[];
      (json['Mrecord'] as List).forEach((e) {});
    }
    ;
  }
}

class mrecord {
  String? TanggalBerkunjung;
  String? Anamnesa;
  String? Diagnosa;
  String? Therapy;

  mrecord({this.TanggalBerkunjung, this.Anamnesa, this.Diagnosa, this.Therapy});
  mrecord.fromJson(Map<String, dynamic> json) {
    TanggalBerkunjung = json['TanggalBerkunjung'];
    Anamnesa = json['Anamnesa'];
    Diagnosa = json['Diagnosa'];
    Therapy = json['Therapy'];
  }

  static void add(fromJson) {}
}
