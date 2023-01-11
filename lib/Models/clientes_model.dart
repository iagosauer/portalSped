import 'dart:convert';

import 'package:portalsped/Models/documentos_model.dart';

class ClientesModel {
  ClientesModel({required this.nome, this.filhos});
  final String nome;
  List<DocumentosModel>? filhos;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'filhos': filhos,
    };
  }

  factory ClientesModel.fromMap(Map<String, dynamic> map) {
    return ClientesModel(
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientesModel.fromJson(String source) =>
      ClientesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
