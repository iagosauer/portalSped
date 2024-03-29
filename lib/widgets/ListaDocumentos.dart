import 'package:portalsped/Classes/Utils.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/documentos_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/documentos_model.dart';

class ListaDocumentos extends StatefulWidget {
  ListaDocumentos(
      {super.key, required this.clienteSelecionado, required this.contador});

  ClientesModel clienteSelecionado;
  ContadoresModel contador;
  String pai = '';
  ValueNotifier<bool> flag = ValueNotifier<bool>(true);
  bool aux = true;
  bool carregando = true;

  @override
  State<ListaDocumentos> createState() => _ListaDocumentosState();
}

class _ListaDocumentosState extends State<ListaDocumentos> {
  List<DocumentosModel> documentos = [];
  @override
  initState() {
    super.initState();
    iniciaTabela();
  }

  iniciaTabela() async {
    if (widget.clienteSelecionado.nome != '' && widget.aux) {
      /*if (widget.pai.compareTo(widget.contador.pasta!) == 0) {
        widget.pai = '${widget.pai}/${widget.clienteSelecionado.nome}';
      }*/
      documentos = await DocumentosRepository().fetchDocumentos(
          widget.contador.pasta!, widget.clienteSelecionado.nome, widget.pai);
      if (widget.pai.compareTo('') != 0) {
        documentos.add(DocumentosModel(
            nome: 'VOLTAR', setTipoDocumento: 'TipoDocumento.back'));
        documentos = documentos.reversed.toList();
      }
      setState(
        () {
          widget.aux = false;
        },
      );
    }
    setState(() {
      widget.carregando = false;
      widget.flag.value = false;
    });
  }

  download(String documento) async {
  }

  @override
  Widget build(BuildContext context) {
    iniciaTabela();
    return Expanded(
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: widget.carregando
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ValueListenableBuilder<bool>(
                  valueListenable: widget.flag,
                  builder: (context, value, _) {
                    return Card(
                      elevation: 2,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: documentos.length,
                          itemBuilder: (_, int index) {
                            return Card(
                              child: ListTile(
                                leading: Icon(
                                  (documentos[index].tipoDocumento ==
                                          TipoDocumento.pasta)
                                      ? Icons.folder
                                      : (documentos[index].tipoDocumento ==
                                              TipoDocumento.documento)
                                          ? Icons.file_download
                                          : Icons.arrow_back,
                                  color: const Color.fromRGBO(161, 201, 247, 1),
                                ),
                                onTap: () {
                                  setState(() {
                                    widget.carregando = true;
                                    widget.flag.value = !widget.flag.value;
                                  });
                                  if (documentos[index].tipoDocumento ==
                                      TipoDocumento.pasta) {
                                    setState(() {
                                      widget.pai.compareTo('') == 0
                                          ? widget.pai = documentos[index].nome
                                          : widget.pai =
                                              '${widget.pai}/${documentos[index].nome}';
                                      widget.aux = true;
                                    });
                                  } else if (documentos[index].tipoDocumento ==
                                      TipoDocumento.back) {
                                    setState(
                                      () {
                                        if (widget.pai.contains('/')) {
                                          widget.pai =
                                              Utils.stringPai(widget.pai);
                                        } else {
                                          widget.pai = '';
                                        }

                                        widget.aux = true;
                                        widget.flag.value = !widget.flag.value;
                                      },
                                    );
                                  } else if (documentos[index].tipoDocumento ==
                                      TipoDocumento.documento) {
                                    download(documentos[index].nome);
                                  }
                                },
                                selectedColor:
                                    const Color.fromRGBO(161, 201, 247, 1),
                                title: Text(
                                  documentos[index].nome,
                                  style: GoogleFonts.prompt(
                                    letterSpacing: 2,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
