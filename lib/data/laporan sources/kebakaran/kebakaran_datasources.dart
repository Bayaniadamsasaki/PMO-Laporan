import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:laporan_masyarakat/model/response/laporan/kebakaran_response_model.dart';

class KebakaranDataSources {
  Future<Either<String, KebakaranResponseModel>> createKebakaran(KebakaranResponseModel kebakaranResponseModel) async {
    final url = Uri.parse("http://192.168.129.1:8000/api/laporankebakaran");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        KebakaranResponseModel().toMap(),
      }),
    );

    if (response.statusCode == 200) {
      return Right(KebakaranResponseModel.fromJson(response.body));
    } else {
      return Left("Failed to create kebakaran");
    }
  }
}
