import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:portalsped/Classes/Valores.dart';
import 'package:portalsped/Models/documentos_model.dart';

class DocumentosRepository {
  Dio dio = Dio();
  Future<List<DocumentosModel>> fetchDocumentos(String escritorio,
   String cliente, String path) async {
    try {
      final response = await dio.post('${Valor.baseUrl}/contadores',
      data: {"nome": escritorio, "cliente": cliente, "path":path},
      options: Options(headers: {"content-Type":"application/json"}));
      final lista = response.data as List;
      return lista.map((e) => DocumentosModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> downloads(String escritorio, String cliente, String path) async {
    String query = 'SPED/$escritorio''/$cliente''/$path';
    Response response = await dio
        .get('${Valor.baseUrl}/contadores/download',
        options: Options(responseType: ResponseType.bytes),
         queryParameters: {'path': query});
    final content = base64Encode(response.data);
    final anchor = html.AnchorElement(
        href: "data:application/octet-stream;charset=utf-16le;base64,$content")
      ..setAttribute("download", cliente+path.substring(path.lastIndexOf('/')))
      ..click();
    if (response.statusCode == 200) {}
    return true;
  }

  Future<bool> downloadsAntigo(String pai) async {
    Response response = await dio
        .get('${Valor.baseUrl}/contadores/$pai',
        options: Options(responseType: ResponseType.bytes),
         queryParameters: {'download': 'true'});
    final content = base64Encode(response.data);
    final anchor = html.AnchorElement(
        href: "data:application/octet-stream;charset=utf-16le;base64,$content")
      ..setAttribute("download", pai.substring(pai.lastIndexOf('/')))
      ..click();
    if (response.statusCode == 200) {}
    return true;
  }
}
