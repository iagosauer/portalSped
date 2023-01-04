import 'package:portalsped/Models/contadores_model.dart';

class ContadoreRepository {
  static Future<List<ContadoresModel>> getContadores() async {
    List<ContadoresModel> contadores = [];

    try {
      contadores = [
        ContadoresModel(nome: 'Escritorio Jupiter'),
        ContadoresModel(nome: 'Escritorio Conde'),
        ContadoresModel(nome: 'Escritorio Fatima do Sul'),
        
      ];
      return contadores;
    } catch (e) {
      throw Exception(e);
    } finally {

    }
  }
}
