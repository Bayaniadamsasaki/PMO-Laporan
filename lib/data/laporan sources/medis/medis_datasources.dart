import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:laporan_masyarakat/model/response/laporan/medis_response_model.dart';

class MedisDatasources {
  Future<Either<String, MedisResponseModel>> createMedis(
      MedisResponseModel medisResponseModel) async {
    final url = Uri.parse("http://10.138.34.112:8000/api/laporanmedis");

    var request = http.MultipartRequest('POST', url);

    request.fields['id'] = medisResponseModel.id?.toString() ?? '';
    request.fields['jenis'] = medisResponseModel.jenis ?? '';
    request.fields['nama'] = medisResponseModel.nama ?? '';
    request.fields['telepon'] = medisResponseModel.telepon ?? '';
    request.fields['lokasi'] = medisResponseModel.lokasi ?? '';
    request.fields['tanggal'] = medisResponseModel.tanggal != null
        ? "${medisResponseModel.tanggal!.year.toString().padLeft(4, '0')}-${medisResponseModel.tanggal!.month.toString().padLeft(2, '0')}-${medisResponseModel.tanggal!.day.toString().padLeft(2, '0')}"
        : '';
    request.fields['isi'] = medisResponseModel.isi ?? '';

    if (medisResponseModel.foto != null) {
      var file = File(medisResponseModel.foto!);
      request.files.add(await http.MultipartFile.fromPath('foto', file.path,
          contentType: MediaType('image', 'jpg')));
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      return Right(MedisResponseModel.fromJson(responseBody));
    } else {
      return const Left("Failed to create medis");
    }
  }

  Future<Either<String, List<MedisResponseModel>>> getMedis() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.138.34.112:8000/api/laporanmedis"));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<MedisResponseModel> result =
            jsonData.map((x) => MedisResponseModel.fromMap(x)).toList();
        return Right(result);
      } else {
        return const Left("Failed to get medis");
      }
    } catch (e) {
      return Left("Exception: $e");
    }
  }

  Future<Either<String, String>> deleteMedis(String id) async {
    try {
      final url = Uri.parse("http://10.138.34.112:8000/api/deletelaporanmedis/$id");

      // Menambahkan id ke body request
      final response = await http.post(
        url,
        body: {'id': id},
      );

      if (response.statusCode == 200) {
        return const Right("Sukses");
      } else {
        return const Left("Gagal menghapus Medis");
      }
    } catch (e) {
      return Left("Exception: $e");
    }
  }

  Future<Either<String, String>> updateMedis(
      MedisResponseModel medisResponseModel) async {
    try {
      final url = Uri.parse(
          "http://10.138.34.112:8000/api/updatelaporanmedis/${medisResponseModel.id}");

      var request = http.MultipartRequest('POST', url);

      request.fields['jenis'] = medisResponseModel.jenis ?? '';
      request.fields['nama'] = medisResponseModel.nama ?? '';
      request.fields['telepon'] = medisResponseModel.telepon ?? '';
      request.fields['lokasi'] = medisResponseModel.lokasi ?? '';
      request.fields['tanggal'] = medisResponseModel.tanggal != null
          ? "${medisResponseModel.tanggal!.year.toString().padLeft(4, '0')}-${medisResponseModel.tanggal!.month.toString().padLeft(2, '0')}-${medisResponseModel.tanggal!.day.toString().padLeft(2, '0')}"
          : '';
      request.fields['isi'] = medisResponseModel.isi ?? '';

      if (medisResponseModel.foto != null) {
        var file = File(medisResponseModel.foto!);
        request.files.add(await http.MultipartFile.fromPath('foto', file.path,
            contentType: MediaType('image', 'jpg')));
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        return const Right("Sukses");
      } else {
        return const Left("Gagal mengupdate Medis");
      }
    } catch (e) {
      return Left("Exception: $e");
    }
  }
}
