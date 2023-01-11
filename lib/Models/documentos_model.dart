import 'dart:convert';

enum TipoDocumento { pasta, documento, back }

class DocumentosModel {
  DocumentosModel(
      {required this.nome,
      this.tipoDocumento,
      this.pai,
      this.filhos,
      this.link});

  final Object? pai;
  List<DocumentosModel>? filhos;
  final String nome;
  final TipoDocumento? tipoDocumento;
  String? link;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'filhos': filhos,
    };
  }

  factory DocumentosModel.fromMap(Map<String, dynamic> map) {
    return DocumentosModel(
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentosModel.fromJson(String source) =>
      DocumentosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
