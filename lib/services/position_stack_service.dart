import 'package:http/http.dart' as http;
import 'package:summaries_app/domain/model/result_cep_model.dart';
import 'package:summaries_app/domain/model/result_position_stack_model.dart';

class PositionStackService {
  static Future<ResultPositionStackModel> fetchLonLat(
      ResultCepModel cepModel) async {
    String url =
        "http://api.positionstack.com/v1/forward?access_key=b093bff973ecfea7e3ef2ffe26f5873b&query=${cepModel.logradouro}%20${cepModel.localidade}%20${cepModel.uf},%20Brasil";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ResultPositionStackModel.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
