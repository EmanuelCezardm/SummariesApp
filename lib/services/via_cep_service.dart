import 'package:http/http.dart' as http;
import 'package:summaries_app/domain/model/result_cep_model.dart';

class ViaCepService {
  static Future<ResultCepModel> fetchCep(String cep) async {
    var url = 'https://viacep.com.br/ws/$cep/json/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ResultCepModel.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
