import 'package:laporan_masyarakat/model/reuqest/laporan/kebakaran_model.dart';
import 'package:laporan_masyarakat/model/response/laporan/kebakaran_response_model.dart';
import 'package:http/http.dart' as http;

class KebakaranDataSources {
  Future<KebakaranResponseModel> createKebakaran(
      KebakaranModel kebakaranModel) async {
    final response = await http.post(
        Uri.parse('http://10.10.162.137:8000/api/laporankebakaran'),
        body: kebakaranModel.toMap());
    final result = KebakaranResponseModel.fromJson(response.body);
    return result;
  }
}
