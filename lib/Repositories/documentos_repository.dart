import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
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

  Future<bool> download(String pai) async {
    final response = await dio
        .get('${Valor.baseUrl}/$pai', queryParameters: {'download': 'true'});
    if (response.statusCode == 200) {
      var socket = await Socket.connect(Valor.baseUrl, 2714);
      const Duration(seconds: 3);
      try {
        print("Connected to:"
            '${socket.remoteAddress.address}:${socket.remotePort}');
        socket.write('Send Data');

        var file = File('1_received.zip').openWrite();
        try {
          await socket.map(toIntList).pipe(file);
        } finally {
          file.close();
        }
      } finally {
        socket.destroy();
      }
    }
    return true;
  }

  List<int> toIntList(Uint8List source) {
    return List.from(source);
  }
}
