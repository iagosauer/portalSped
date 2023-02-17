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
  ArgumentosClientesPage args;

  ClientesPage({super.key, required this.args});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  late ContadoresModel contador;
  late bool admin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    admin = widget.args.admin;
    contador = widget.args.contador;
    _verificaNumeroDeLinhas(contador.clientes!);
  }

  var numeroLinhas = ValueNotifier(0);

  final int numeroCaracteres = 12;

  ValueNotifier<ClientesModel> clienteSelecionado =
      ValueNotifier<ClientesModel>(ClientesModel(nome: ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: admin
          ? Appbar.appBarManutencao(context)
          : Appbar.appBar(contador, context),
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
                        child: contador.clientes!.isEmpty
                            ? const Text(
                                'Não possui nenhuma pasta de Clientes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            : Card(
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListaClientes(
                                    contador: contador,
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
                          clienteSelecionado: value, contador: contador);
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

  _verificaNumeroDeLinhas(List<ClientesModel> clientes) {
    List<String> valores = [];
    if (clientes.isNotEmpty) {
      for (ClientesModel x in clientes) {
        valores.add(x.nome);
      }
      numeroLinhas.value =
          Utils.numerosDeLinhasTotal(valores, numeroCaracteres);
    }
  }
}

class ArgumentosClientesPage {
  ArgumentosClientesPage(this.contador, this.admin);
  final ContadoresModel contador;
  final bool admin;
}
