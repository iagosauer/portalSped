import 'dart:convert';
import 'dart:html';

enum TipoDocumento { pasta , documento, back }

class DocumentosModel {
  DocumentosModel(
      {required this.nome,
      this.tipoDocumento,
      this.pai,
      this.filhos,
      this.setTipoDocumento,
      this.link
      }){
        if(setTipoDocumento != null)
        {
          if(setTipoDocumento!.compareTo('TipoDocumento.back') == 0)
          {
            tipoDocumento = TipoDocumento.back;
          }
          else if(setTipoDocumento!.compareTo('TipoDocumento.pasta') == 0)
          {
            tipoDocumento = TipoDocumento.pasta;
          }
          else 
          {
            tipoDocumento =TipoDocumento.documento;
          }
        }
      }
  

  final Object? pai;
  List<DocumentosModel>? filhos;
  final String nome;
  final String? setTipoDocumento;
  TipoDocumento? tipoDocumento;
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
      setTipoDocumento: map['tipo'] as String
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentosModel.fromJson(String source) =>
      DocumentosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
