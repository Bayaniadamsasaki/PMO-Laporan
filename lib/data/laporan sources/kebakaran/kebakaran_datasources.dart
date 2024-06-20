import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:laporan_masyarakat/model/response/laporan/kebakaran_response_model.dart';

class KebakaranDataSources {
  Future<KebakaranResponseModel> createKebakaran(KebakaranResponseModel request) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.9:8000/api/laporankebakaran'),
        body: request.toJson(),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return KebakaranResponseModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create kebakaran');
      }
    } catch (e) {
      throw Exception('Failed to create kebakaran');
    }
  }
}
