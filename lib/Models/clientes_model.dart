import 'package:portalsped/Models/documentos_model.dart';

class ClientesModel {
  ClientesModel({required this.nome, this.filhos});
  final String nome;
  List<DocumentosModel>? filhos;
}