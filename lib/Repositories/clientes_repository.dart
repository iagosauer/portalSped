import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Classes/Valores.dart';

class ClientesRepository {
  Dio dio = Dio();
  Future<List<ClientesModel>> fetchClientes(String escritorio) async {
    try {
      final response = await dio.get('${Valor.baseUrl}/$escritorio');
      final lista = jsonDecode(response.data) as List;
      return lista.map((e) => ClientesModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
