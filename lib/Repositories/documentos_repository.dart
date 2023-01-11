import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:portalsped/Classes/Valores.dart';
import 'package:portalsped/Models/documentos_model.dart';

class DocumentosRepository {
  Dio dio = Dio();
  Future<List<DocumentosModel>> fetchDocumentos(String pai) async {
    try {
      final response = await dio.get('${Valor.baseUrl}/$pai');
      final lista = JsonDecoder(response.data) as List;
      return lista.map((e) => DocumentosModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
