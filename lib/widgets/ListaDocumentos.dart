import 'dart:developer';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/documentos_model.dart';

class ListaDocumentos extends StatefulWidget {
  ListaDocumentos({super.key, required this.clienteSelecionado});
  ClientesModel clienteSelecionado;

  @override
  State<ListaDocumentos> createState() => _ListaDocumentosState();
}

class _ListaDocumentosState extends State<ListaDocumentos> {
  bool carregando = true;
  bool aux = true;
  List<DocumentosModel> documentos = [];
  ValueNotifier<bool> flag = ValueNotifier<bool>(true);
  initState() {
    super.initState();
  }

  iniciaTabela() async {

    if (widget.clienteSelecionado.nome != '' && aux) {
      documentos = widget.clienteSelecionado.filhos!;
    }
    /* await DocumentosRepository.fetchDocumentos(cliente: widget.cliente);*/
    setState(() {
      carregando = false;
      aux = true;
    });

  }

    _abrirUrl(String url) async {
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        // ignore: deprecated_member_use
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

  @override
  Widget build(BuildContext context) {
    iniciaTabela();
    return Expanded(
      child: Card(
          child: carregando
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ValueListenableBuilder<bool>(
                  valueListenable: flag,
                  builder: (context, value, _) {
                    return SingleChildScrollView(
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
                                    :(documentos[index].tipoDocumento ==
                                        TipoDocumento.documento)? Icons.file_download
                                        : Icons.arrow_back,
                                color: const Color.fromRGBO(161, 201, 247, 1),
                              ),
                              onTap: () {

                                flag.value = !flag.value;
                                if (documentos[index].tipoDocumento ==
                                    TipoDocumento.pasta) {
                                  flag.value = !flag.value;
                                  setState(() {
                                    documentos = documentos[index].filhos!;
                                    aux = false;
                                  });
                                }
                                else if(documentos[index].tipoDocumento
                                == TipoDocumento.back
                                )
                                {
                                  DocumentosModel pai;
                                  if(documentos[index].pai is ClientesModel) 
                                  { 
                                    setState(() {
                                       aux = true;
                                    });
                                  }
                                  else if(documentos[index].pai is DocumentosModel)
                                  {
                                    pai = documentos[index].pai as DocumentosModel;
                                    documentos = pai.filhos!;
                                  }
                                }
                                else if(documentos[index].tipoDocumento
                                == TipoDocumento.documento
                                )
                                {
                                  if(documentos[index].link != null)
                                  {
                                    _abrirUrl(documentos[index].link!);
                                  }
                                  else
                                  {
                                    log('nulo');
                                  }
                                  
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
                    );
                  },
                )),
    );
  }
}
