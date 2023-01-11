import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Classes/Valores.dart';

class ContadoresRepository {
  final dio = Dio();

  Future<List<ContadoresModel>> fetchUsuario() async {
    List<ContadoresModel> retorno;
    try {
      final response = await dio.get('${Valor.baseUrl}');
      final lista = jsonDecode(response.data) as List;
      return lista.map((e) => ContadoresModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
/*
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
     }*/
}
