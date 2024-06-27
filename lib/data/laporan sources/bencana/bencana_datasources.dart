import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:laporan_masyarakat/model/response/laporan/bencana_response_model.dart';

class BencanaDatasources {
  Future<Either<String, BencanaResponseModel>> createBencana(
      BencanaResponseModel bencanaResponseModel) async {
    final url = Uri.parse("http://10.138.34.112:8000/api/laporanbencana");

    var request = http.MultipartRequest('POST', url);

    request.fields['id'] = bencanaResponseModel.id?.toString() ?? '';
    request.fields['jenis'] = bencanaResponseModel.jenis ?? '';
    request.fields['nama'] = bencanaResponseModel.nama ?? '';
    request.fields['telepon'] = bencanaResponseModel.telepon ?? '';
    request.fields['lokasi'] = bencanaResponseModel.lokasi ?? '';
    request.fields['tanggal'] = bencanaResponseModel.tanggal != null
        ? "${bencanaResponseModel.tanggal!.year.toString().padLeft(4, '0')}-${bencanaResponseModel.tanggal!.month.toString().padLeft(2, '0')}-${bencanaResponseModel.tanggal!.day.toString().padLeft(2, '0')}"
        : '';
    request.fields['isi'] = bencanaResponseModel.isi ?? '';

    if (bencanaResponseModel.foto != null) {
      var file = File(bencanaResponseModel.foto!);
      request.files.add(await http.MultipartFile.fromPath('foto', file.path,
          contentType: MediaType('image', 'jpg')));
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      return Right(BencanaResponseModel.fromJson(responseBody));
    } else {
      return const Left("Failed to create Bencana Alam");
    }
  }

  Future<Either<String, List<BencanaResponseModel>>> getBencana() async {
    try {
      final response = await http
          .get(Uri.parse("http://10.138.34.112:8000/api/laporanbencana"));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<BencanaResponseModel> result =
            jsonData.map((x) => BencanaResponseModel.fromMap(x)).toList();

        return Right(result);
      } else {
        return const Left("Failed to get bencana alam");
      }
    } catch (e) {
      return Left("Exception: $e");
    }
  }

  Future<Either<String, String>> deleteBencana(String id) async {
    try {
      final url = Uri.parse("http://10.138.34.112:8000/api/deletelaporanbencana/$id");

      // Menambahkan id ke body request
      final response = await http.post(
        url,
        body: {'id': id},
      );

      if (response.statusCode == 200) {
        return const Right("Sukses");
      } else {
        return const Left("Gagal menghapus Bencana");
      }
    } catch (e) {
      return Left("Exception: $e");
    }
  }

  Future<Either<String, String>> updateBencana(
      BencanaResponseModel bencanaResponseModel) async {
    try {
      final url = Uri.parse(
          "http://10.138.34.112:8000/api/updatelaporanbencana/${bencanaResponseModel.id}");

      var request = http.MultipartRequest('POST', url);

      request.fields['jenis'] = bencanaResponseModel.jenis ?? '';
      request.fields['nama'] = bencanaResponseModel.nama ?? '';
      request.fields['telepon'] = bencanaResponseModel.telepon ?? '';
      request.fields['lokasi'] = bencanaResponseModel.lokasi ?? '';
      request.fields['tanggal'] = bencanaResponseModel.tanggal != null
          ? "${bencanaResponseModel.tanggal!.year.toString().padLeft(4, '0')}-${bencanaResponseModel.tanggal!.month.toString().padLeft(2, '0')}-${bencanaResponseModel.tanggal!.day.toString().padLeft(2, '0')}"
          : '';
      request.fields['isi'] = bencanaResponseModel.isi ?? '';

      if (bencanaResponseModel.foto != null) {
        var file = File(bencanaResponseModel.foto!);
        request.files.add(await http.MultipartFile.fromPath('foto', file.path,
            contentType: MediaType('image', 'jpg')));
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        return const Right("Sukses");
      } else {
        return const Left("Gagal mengupdate Bencana");
      }
    } catch (e) {
      return Left("Exception: $e");
    }
  }
}
