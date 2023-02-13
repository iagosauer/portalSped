import 'dart:convert';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Repositories/usuario_repository.dart';

class ContadoresModel {
  final String nome;
  final String? pasta;
  final String? senha;
  List<ClientesModel>? clientes;

  ContadoresModel({required this.nome, this.clientes, this.pasta, this.senha});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'clientes': clientes,
      'senha': senha
    };
  }

  factory ContadoresModel.fromMap(Map<String, dynamic> map) {
    return ContadoresModel(
        nome: map['nome'] as String, senha: (map['senha']??'') as String);
  }

  String toJson() => json.encode(toMap());

  factory ContadoresModel.fromJson(String source) =>
      ContadoresModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PastasModel {
  PastasModel({required this.nome});
  String nome;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'nome': nome};
  }

    factory PastasModel.fromMap(Map<String, dynamic> map) {
    return PastasModel(
        nome: map['nome'] as String);
  }
    String toJson() => json.encode(toMap());
}
