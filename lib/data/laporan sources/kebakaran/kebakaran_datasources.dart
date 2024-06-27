import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:laporan_masyarakat/model/response/laporan/kebakaran_response_model.dart';

class KebakaranDataSources {
  Future<Either<String, KebakaranResponseModel>> createKebakaran(
      KebakaranResponseModel kebakaranResponseModel) async {
    final url = Uri.parse("http://10.138.34.112:8000/api/laporankebakaran");

    var request = http.MultipartRequest('POST', url);

    request.fields['id'] = kebakaranResponseModel.id?.toString() ?? '';
    request.fields['jenis'] = kebakaranResponseModel.jenis ?? '';
    request.fields['nama'] = kebakaranResponseModel.nama ?? '';
    request.fields['telepon'] = kebakaranResponseModel.telepon ?? '';
    request.fields['lokasi'] = kebakaranResponseModel.lokasi ?? '';
    request.fields['tanggal'] = kebakaranResponseModel.tanggal != null
        ? "${kebakaranResponseModel.tanggal!.year.toString().padLeft(4, '0')}-${kebakaranResponseModel.tanggal!.month.toString().padLeft(2, '0')}-${kebakaranResponseModel.tanggal!.day.toString().padLeft(2, '0')}"
        : '';
    request.fields['isi'] = kebakaranResponseModel.isi ?? '';

    if (kebakaranResponseModel.foto != null) {
      var file = File(kebakaranResponseModel.foto!);
      request.files.add(await http.MultipartFile.fromPath('foto', file.path,
          contentType: MediaType('image', 'jpg')));
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      return Right(KebakaranResponseModel.fromJson(responseBody));
    } else {
      return const Left("Failed to create kebakaran");
    }
  }

  Future<Either<String, List<KebakaranResponseModel>>> getKebakaran() async {
    try {
      final response =
          await http.get(Uri.parse("http://10.138.34.112:8000/api/laporan"));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<KebakaranResponseModel> result =
            jsonData.map((x) => KebakaranResponseModel.fromMap(x)).toList();

        return Right(result);
      } else {
        return const Left("Failed to get kebakaran");
      }
    } catch (e) {
      return Left("Exception: $e");
    }
  }

  Future<Either<String, String>> deleteKebakaran(String id) async {
    try {
      final url = Uri.parse("http://10.138.34.112:8000/api/deletelaporan/$id");

      // Menambahkan id ke body request
      final response = await http.post(
        url,
        body: {'id': id},
      );

      if (response.statusCode == 200) {
        return const Right("Sukses");
      } else {
        return const Left("Gagal menghapus kebakaran");
      }
    } catch (e) {
      return Left("Exception: $e");
    }
  }

  //update kebakaran
  Future<Either<String, String>> updateKebakaran(
      KebakaranResponseModel kebakaranResponseModel) async {
    try {
      final url = Uri.parse(
          "http://10.138.34.112:8000/api/updatelaporan/${kebakaranResponseModel.id}");

      var request = http.MultipartRequest('POST', url);

      request.fields['jenis'] = kebakaranResponseModel.jenis ?? '';
      request.fields['nama'] = kebakaranResponseModel.nama ?? '';
      request.fields['telepon'] = kebakaranResponseModel.telepon ?? '';
      request.fields['lokasi'] = kebakaranResponseModel.lokasi ?? '';
      request.fields['tanggal'] = kebakaranResponseModel.tanggal != null
          ? "${kebakaranResponseModel.tanggal!.year.toString().padLeft(4, '0')}-${kebakaranResponseModel.tanggal!.month.toString().padLeft(2, '0')}-${kebakaranResponseModel.tanggal!.day.toString().padLeft(2, '0')}"
          : '';
      request.fields['isi'] = kebakaranResponseModel.isi ?? '';

      if (kebakaranResponseModel.foto != null) {
        var file = File(kebakaranResponseModel.foto!);
        request.files.add(await http.MultipartFile.fromPath('foto', file.path,
            contentType: MediaType('image', 'jpg')));
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        return const Right("Sukses");
      } else {
        return const Left("Gagal mengupdate kebakaran");
      }
    } catch (e) {
      return Left("Exception: $e");
    }
  }
}
