import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Classes/Valores.dart';

class ContadoresRepository {
  final dio = Dio();

  Future<List<ContadoresModel>> fetchUsuario() async {
    List<ContadoresModel> retorno;
    try {
      final response = await dio.get('${Valor.baseUrl}/contadores');
      final lista = jsonDecode(response.data) as List;
      return lista.map((e) => ContadoresModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
