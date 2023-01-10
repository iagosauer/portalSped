

enum TipoDocumento {pasta, documento, back}
class DocumentosModel{
  DocumentosModel({required this.nome,
  required this.tipoDocumento,
  this.pai,
  this.filhos, 
  this.link
  });

  final Object? pai;
  List<DocumentosModel>? filhos;
  final String nome;
  final TipoDocumento tipoDocumento;
  String? link;


}

