import 'package:dio/dio.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/contadores_model.dart';

class ClientesRepository {
  final dio = Dio();

  static Future<List<ClientesModel>> fetchClientes({
    required ContadoresModel contador,
  }) async {
    List<ClientesModel> clientes = [
      new ClientesModel(nome: 'Mais Moveis'),
      new ClientesModel(nome: 'Yudisom'),
      new ClientesModel(nome: 'Madenorte'),
      new ClientesModel(nome: 'Fortaleza'),
      new ClientesModel(nome: 'Oficina 147'),
      new ClientesModel(nome: 'Portal'),
      new ClientesModel(nome: 'Mercado'),
      new ClientesModel(nome: 'Mais Moveis'),
      new ClientesModel(nome: 'Yudisom'),
      new ClientesModel(nome: 'Madenorte'),
      new ClientesModel(nome: 'Fortaleza'),
      new ClientesModel(nome: 'Oficina 147'),
      new ClientesModel(nome: 'Portal'),
      new ClientesModel(nome: 'Mercado'),
    ];

    return clientes;
  }
}
