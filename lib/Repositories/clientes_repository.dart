
import 'package:dio/dio.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Classes/Valores.dart';

class ClientesRepository {
  Dio dio = Dio();
  Future<List<ClientesModel>> fetchClientes(
      String escritorio, String senha) async {
    try {
      final response = await dio.post('${Valor.baseUrl}/contadores', data:
      {"nome": escritorio, "cliente": "", "path": ""}, 
      options: Options(headers: {"content-Type":"application/json"})
      );
      if (response.statusCode == 200) {
        final lista = response.data as List;
        return lista.map((e) => ClientesModel.fromMap(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> _verificaSenha(String escritorio, String senha) async {
    try {
      final response = await dio.get(
        '${Valor.baseUrl}/contadores/$escritorio',
        queryParameters: {
          'pass': senha,
        },
      );
      return (response.data as String) == 'true';
    } catch (e) {
      throw Exception(e);
    }
  }
}
