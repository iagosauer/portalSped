import 'dart:developer';
import 'package:portalsped/Classes/Utils.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/documentos_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/documentos_model.dart';

class ListaDocumentos extends StatefulWidget {
  ListaDocumentos({super.key, required this.clienteSelecionado, required this.contador});
  ClientesModel clienteSelecionado;
  ContadoresModel contador;

  @override
  State<ListaDocumentos> createState() => _ListaDocumentosState();
}

class _ListaDocumentosState extends State<ListaDocumentos> {
  bool carregando = true;
  bool aux = true;
  List<DocumentosModel> documentos = [];
  ValueNotifier<bool> flag = ValueNotifier<bool>(true);
  String pai = '';
  initState() {
    super.initState();
    pai = widget.contador.nome;
  }

  iniciaTabela() async {

    if (widget.clienteSelecionado.nome != '' && aux) {
      if(pai.compareTo(widget.contador.nome) == 0)
      {
        pai = '$pai/${widget.clienteSelecionado.nome}';
      }
      print('PAI: $pai');
      documentos = await DocumentosRepository().fetchDocumentos(pai);
      if(Utils.numeroBarrasString(pai)>1)
      {
        documentos.add(DocumentosModel(nome: 'VOLTAR', 
        setTipoDocumento: 'TipoDocumento.back'
        ));
        documentos = documentos.reversed.toList();
      }
    setState(() {
      aux = false;
    });
    }
    setState(() {
      carregando = false;
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
                                if (documentos[index].tipoDocumento ==
                                    TipoDocumento.pasta) {
                                  setState(() {
                                    pai = '$pai/${documentos[index].nome}';
                                    aux = true;
                                    flag.value = !flag.value;
                                  });
                                }
                                else if(documentos[index].tipoDocumento
                                == TipoDocumento.back
                                )
                                {
                                  setState(() {
                                    pai = Utils.stringPai(pai);
                                    aux = true;
                                    flag.value = !flag.value;
                                  });

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
