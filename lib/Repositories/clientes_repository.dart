import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Classes/Valores.dart';

class ClientesRepository {
  Dio dio = Dio();
  Future<List<ClientesModel>> fetchClientes(
      String escritorio, String senha) async {

    if(await _verificaSenha(escritorio, senha))
    {
      final response = await dio
        .get('${Valor.baseUrl}/$escritorio');
    if (response.statusCode == 200) {
      final lista = jsonDecode(response.data) as List;
      return lista.map((e) => ClientesModel.fromMap(e)).toList();
    }
    }    

    return [];
  }

  _verificaSenha(String escritorio, String senha)
  async {
    final response = await dio
        .get('${Valor.baseUrl}/$escritorio', queryParameters: {'pass': senha});
    if(response.data == 'true')
    {
      return true;
    }
    return false;

  }
}
