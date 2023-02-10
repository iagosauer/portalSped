import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portalsped/Classes/Utils.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Widgets/ListaDocumentos.dart';
import 'package:portalsped/Widgets/appBar.dart';
import 'package:portalsped/Widgets/lista_clientes.dart';

// ignore: must_be_immutable
class ClientesPage extends StatefulWidget {
  ContadoresModel contador;

  ClientesPage({super.key, required this.contador});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verificaNumeroDeLinhas(widget.contador.clientes!);
  }
  var numeroLinhas = ValueNotifier(0);

  final int numeroCaracteres = 12;

  ValueNotifier<ClientesModel> clienteSelecionado =
      ValueNotifier<ClientesModel>(ClientesModel(nome: ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar(widget.contador, context),
      body: Stack(
        children: [
          Positioned.fill(
            left: 10,
            right: 10,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                        height: (130 + (numeroLinhas.value * 17)),
                        child: Card(
                          elevation: 20,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                          child: ListaClientes(
                              contador: widget.contador,
                              clienteSelecionado: clienteSelecionado,
                              numeroLinhas: numeroLinhas.value,
                              numeroCaracteres: numeroCaracteres),
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder<ClientesModel>(
                    valueListenable: clienteSelecionado,
                    builder: ((context, value, _) {
                      return ListaDocumentos(
                          clienteSelecionado: value, contador: widget.contador);
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _verificaNumeroDeLinhas(List<ClientesModel> clientes)
  {
    List<String> valores = [];
    for(ClientesModel x in clientes)
    {
      valores.add(x.nome);
    }
    numeroLinhas.value = Utils.numerosDeLinhasTotal(valores, numeroCaracteres);
  }
}
