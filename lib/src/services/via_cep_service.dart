import 'package:http/http.dart' as http;
//import 'package:search_cep/search_cep.dart';
import 'package:desafio1/src/modules/home/model/address_model.dart';


class ViaCepService {
  static Future<AddressModel> fetchCep({required String cep}) async {
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      return AddressModel.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}