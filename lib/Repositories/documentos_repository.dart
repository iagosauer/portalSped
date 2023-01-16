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
  Future<List<DocumentosModel>> fetchDocumentos(String pai) async {
    try {
      final response = await dio.get('${Valor.baseUrl}/$pai');
      final lista = jsonDecode(response.data) as List;
      return lista.map((e) => DocumentosModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }


  Future<bool> downloads(String pai) async {
    Response response = await dio
        .get('${Valor.baseUrlDownload}/$pai',
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
