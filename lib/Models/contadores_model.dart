import 'dart:convert';

import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/widgets/lista_clientes.dart';

class ContadoresModel {
  final String nome;
  List<ClientesModel>? clientes;

  ContadoresModel({required this.nome, this.clientes});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'clientes': clientes,
    };
  }

  factory ContadoresModel.fromMap(Map<String, dynamic> map) {
    return ContadoresModel(
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContadoresModel.fromJson(String source) =>
      ContadoresModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
