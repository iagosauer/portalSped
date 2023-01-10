import 'package:dio/dio.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/documentos_model.dart';

class DocumentosRepository {
  final dio = Dio();

  static Future<List<DocumentosModel>> fetchDocumentos({
    required ClientesModel cliente,
  }) async {
    List<DocumentosModel> documentos=[];
    
    documentos.add(DocumentosModel(nome: 'Voltar', tipoDocumento: TipoDocumento.back));
    for(int i = 0; i < 30; i++)
    {
      if(i%2 == 0)
      {
        documentos.add(DocumentosModel(nome: 'Documento $i', tipoDocumento: TipoDocumento.documento));
      }
      else
      {
      documentos.add(DocumentosModel(nome: 'Documento $i', tipoDocumento: TipoDocumento.pasta));
      }
    }

    return documentos;
  }
}
