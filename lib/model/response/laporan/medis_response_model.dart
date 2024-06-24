import 'dart:convert';

class MedisResponseModel {
  final int? id;
  final String? foto;
  final String? jenis;
  final String? nama;
  final String? telepon;
  final String? lokasi;
  final DateTime? tanggal;
  final String? isi;

  MedisResponseModel({
    this.id,
    this.foto,
    this.jenis,
    this.nama,
    this.telepon,
    this.lokasi,
    this.tanggal,
    this.isi,
  });

  factory MedisResponseModel.fromJson(String str) =>
      MedisResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MedisResponseModel.fromMap(Map<String, dynamic> json) =>
      MedisResponseModel(
        id: json["id"],
        foto: json["foto"],
        jenis: json["jenis"],
        nama: json["nama"],
        telepon: json["telepon"],
        lokasi: json["lokasi"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        isi: json["isi"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "foto": foto,
        "jenis": jenis,
        "nama": nama,
        "telepon": telepon,
        "lokasi": lokasi,
        "tanggal": tanggal == null
            ? null
            : "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "isi": isi,
      };
}
