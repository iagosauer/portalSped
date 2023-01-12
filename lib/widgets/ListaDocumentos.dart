import 'package:portalsped/Classes/Utils.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/documentos_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/documentos_model.dart';

class ListaDocumentos extends StatefulWidget {
  ListaDocumentos(
      {super.key, required this.clienteSelecionado, required this.contador}) {
    pai = contador.nome;
  }

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

  iniciaTabela() async {
    if (widget.clienteSelecionado.nome != '' && widget.aux) {
      if (widget.pai.compareTo(widget.contador.nome) == 0) {
        widget.pai = '${widget.pai}/${widget.clienteSelecionado.nome}';
      }
      documentos = await DocumentosRepository().fetchDocumentos(widget.pai);
      if (Utils.numeroBarrasString(widget.pai) > 1) {
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

  download(String documento)
  async {
    bool download = await DocumentosRepository().download(widget.pai+'/'+documento);

  }

  @override
  Widget build(BuildContext context) {
    iniciaTabela();
    return Expanded(
      child: Card(
          child: widget.carregando
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ValueListenableBuilder<bool>(
                  valueListenable: widget.flag,
                  builder: (context, value, _) {
                    return Column(
                      children: [
                        Text(widget.clienteSelecionado.nome),
                        SingleChildScrollView(
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
                                    color:
                                        const Color.fromRGBO(161, 201, 247, 1),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      widget.carregando = true;
                                      widget.flag.value = !widget.flag.value;
                                    });
                                    if (documentos[index].tipoDocumento ==
                                        TipoDocumento.pasta) {
                                      setState(() {
                                        widget.pai =
                                            '${widget.pai}/${documentos[index].nome}';
                                        widget.aux = true;
                                      });
                                    } else if (documentos[index]
                                            .tipoDocumento ==
                                        TipoDocumento.back) {
                                      setState(
                                        () {
                                          widget.pai =
                                              Utils.stringPai(widget.pai);
                                          widget.aux = true;
                                          widget.flag.value =
                                              !widget.flag.value;
                                        },
                                      );
                                    } else if (documentos[index]
                                            .tipoDocumento ==
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
                      ],
                    );
                  },
                )),
    );
  }
}
