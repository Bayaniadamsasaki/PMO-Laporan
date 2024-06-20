// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class KebakaranResponseModel {
  int? id;
  String? foto;
  String? jenis;
  String? nama;
  String? telepon;
  String? lokasi;
  DateTime? tanggal;
  String? isi;
  DateTime? createdAt;
  DateTime? updatedAt;

  KebakaranResponseModel({
    this.id,
    this.foto,
    this.jenis,
    this.nama,
    this.telepon,
    this.lokasi,
    this.tanggal,
    this.isi,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'foto': foto,
      'jenis': jenis,
      'nama': nama,
      'telepon': telepon,
      'lokasi': lokasi,
      'tanggal': tanggal?.millisecondsSinceEpoch,
      'isi': isi,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory KebakaranResponseModel.fromMap(Map<String, dynamic> map) {
    return KebakaranResponseModel(
      id: map['id'] != null ? map['id'] as int : null,
      foto: map['foto'] != null ? map['foto'] as String : null,
      jenis: map['jenis'] != null ? map['jenis'] as String : null,
      nama: map['nama'] != null ? map['nama'] as String : null,
      telepon: map['telepon'] != null ? map['telepon'] as String : null,
      lokasi: map['lokasi'] != null ? map['lokasi'] as String : null,
      tanggal: map['tanggal'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['tanggal'] as int)
          : null,
      isi: map['isi'] != null ? map['isi'] as String : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory KebakaranResponseModel.fromJson(String source) =>
      KebakaranResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
