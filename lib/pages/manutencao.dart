import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Pages/editaCliente.dart';
import 'package:portalsped/Repositories/contadores_repository.dart';
import 'package:portalsped/Widgets/appBar.dart';
import 'package:portalsped/Widgets/janela_Dialog.dart';

class ManutencaoPage extends StatefulWidget {
  ManutencaoPage({super.key, required this.contador});
  ContadoresModel contador;
  ValueNotifier<ContadoresModel>? contadorSelecionado;

  @override
  State<ManutencaoPage> createState() => _ManutencaoPageState();
}

class _ManutencaoPageState extends State<ManutencaoPage> {
  List<ContadoresModel> contadores = [];
  bool carregando = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  _init() async {
    contadores = await ContadoresRepository.BuscaContadores(context);
    setState(() {
      carregando = false;
    });
  }

  bool _verificaPermissao() {
    if ('portalAdmin'.compareTo(widget.contador.nome) == 0) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    // TODO: implement build
    return carregando
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : _verificaPermissao()
            ? Scaffold(
                appBar: Appbar.appBarManutencao(context),
                body: Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: largura - 100,
                    child: Column(
                      children: [
                        const Text(
                          'Usuários',
                          style: TextStyle(fontSize: 20),
                        ),
                        Card(
                            child: SingleChildScrollView(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: contadores.length,
                              itemBuilder: (_, int index) {
                                return Card(
                                  color: index%2!=0 ? Colors.white: Color.fromARGB(255, 211, 189, 179),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).pushNamed('/editar',
                                       arguments: ArgumentsEditar(contadores[index], widget.contador), );
                                    },
                                    leading:  Icon(
                                      Icons.person,
                                      color: index%2!=0 ? Colors.black: Colors.white,
                                    ),
                                    title: Text(contadores[index].nome,
                                    style: TextStyle(color: index%2!=0 ? Colors.black: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     ),
                                    ),
                                  ),
                                );
                              }),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            : const Card(child: Text('Usuário não autorizado'));
  }
}

