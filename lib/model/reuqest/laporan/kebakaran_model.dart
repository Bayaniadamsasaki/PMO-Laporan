// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class KebakaranModel {
  String? foto;
  String? jenis;
  String? nama;
  String? telepon;
  String? lokasi;
  DateTime? tanggal;
  String? isi;
  KebakaranModel({
    this.foto,
    this.jenis,
    this.nama,
    this.telepon,
    this.lokasi,
    this.tanggal,
    this.isi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foto': foto,
      'jenis': jenis,
      'nama': nama,
      'telepon': telepon,
      'lokasi': lokasi,
      'tanggal': tanggal?.millisecondsSinceEpoch,
      'isi': isi,
    };
  }

  factory KebakaranModel.fromMap(Map<String, dynamic> map) {
    return KebakaranModel(
      foto: map['foto'] != null ? map['foto'] as String : null,
      jenis: map['jenis'] != null ? map['jenis'] as String : null,
      nama: map['nama'] != null ? map['nama'] as String : null,
      telepon: map['telepon'] != null ? map['telepon'] as String : null,
      lokasi: map['lokasi'] != null ? map['lokasi'] as String : null,
      tanggal: map['tanggal'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['tanggal'] as int)
          : null,
      isi: map['isi'] != null ? map['isi'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory KebakaranModel.fromJson(String source) =>
      KebakaranModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
