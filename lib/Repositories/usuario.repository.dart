import 'package:dio/dio.dart';
import 'package:portalsped/Models/contadores_model.dart';

class UsuarioRepository {
  final dio = Dio();

    static Future<bool> fetchLogin(
      {required String login,
      required String senha,
      }) async {
        return true;
  }


/*
  Future<List<ContadoresModel>> fetchUsuario() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/usuarios');
      final lista = response.data as List;
      return lista.map((e) => UsuarioModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> fetchLogin(
      {required String login,
      required String senha,
      }) async {
    try {
      final response = await dio.post(
        '${Valor.baseUrl}/login',
        data: _loginToMap(login, senha),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

    Map<String, dynamic> _loginToMap(
     String login, String senha) {
      return <String, dynamic>{
      'login': login,
      'senha': senha,
      };
     }
     */
}