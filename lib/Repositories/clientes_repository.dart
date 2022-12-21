import 'package:dio/dio.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/contadores_model.dart';

class ClientesRepository {
  final dio = Dio();

  static Future<List<ClientesModel>> fetchClientes({
    required ContadoresModel contador,
  }) async {
    List<ClientesModel> clientes = [
      ClientesModel(nome: 'Mais Moveis'),
      ClientesModel(nome: 'Yudisom'),
      ClientesModel(nome: 'Madenorte'),
      ClientesModel(nome: 'Fortaleza'),
      ClientesModel(nome: 'Oficina 147'),
      ClientesModel(nome: 'Portal'),
      ClientesModel(nome: 'Mercado'),
      ClientesModel(nome: 'Mais Moveis'),
      ClientesModel(nome: 'Yudisom'),
      ClientesModel(nome: 'Madenorte'),
      ClientesModel(nome: 'Fortaleza'),
      ClientesModel(nome: 'Oficina 147'),
      ClientesModel(nome: 'Portal'),
      ClientesModel(nome: 'Mercado'),
    ];

    return clientes;
  }
}
