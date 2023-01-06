import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Testes/adicionaValores.dart';

class ContadoreRepository {
  static Future<List<ContadoresModel>> getContadores() async {
    List<ContadoresModel> contadores = [];

    try {
      contadores = AdicionaValores.getContadores();
      return contadores;
    } catch (e) {
      throw Exception(e);
    } finally {

    }
  }
}
