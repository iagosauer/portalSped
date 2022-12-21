import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/documentos_model.dart';
import 'package:portalsped/Repositories/documentos_repository.dart';

class ListaDocumentos extends StatefulWidget {
  ListaDocumentos({super.key, required this.cliente});
  ClientesModel cliente;

  @override
  State<ListaDocumentos> createState() => _ListaDocumentosState();
}

class _ListaDocumentosState extends State<ListaDocumentos> {
  bool carregando = true;
  List<DocumentosModel> documentos = [];
  initState() {
    iniciaTabela();
  }

  iniciaTabela() async {
    documentos =
        await DocumentosRepository.fetchDocumentos(cliente: widget.cliente);
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: carregando
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: documentos.length,
                    itemBuilder: (_, int index) {
                      if(index == 0)
                      {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              log('back');
                            },
                            leading: Icon(Icons.arrow_back),
                            title: Text('BACK'),
                          ),
                        );
                      }

                      return Card(
                        child: ListTile(
                          leading: Icon((documentos[index].tipoDocumento ==
                                  TipoDocumento.pasta)
                                  ? Icons.folder : Icons.file_download,
                              color: const Color.fromRGBO(161, 201, 247, 1),
                              ),
                          onTap: () => log('$index'),
                          selectedColor: const Color.fromRGBO(161, 201, 247, 1),
                          title: Text(documentos[index].nome,
                          style:  GoogleFonts.prompt(
                            letterSpacing: 2,
                            color: Colors.black,
                          ),
                          ),
                        ),
                      );
                    },),
              ),
      ),
    );
  }
}
