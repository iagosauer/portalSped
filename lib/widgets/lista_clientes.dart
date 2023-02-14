// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portalsped/Classes/Utils.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/clientes_repository.dart';

class ListaClientes extends StatefulWidget {
  ListaClientes(
      {super.key,
      required this.contador,
      required this.clienteSelecionado,
      required this.numeroLinhas,
      required this.numeroCaracteres});
  final numeroCaracteres;
  final ContadoresModel contador;
  final numeroLinhas;
  ValueNotifier<ClientesModel>? clienteSelecionado;
  @override
  State<ListaClientes> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ListaClientes> {
  late List<Widget> clientesWidget;
  late List<ClientesModel> clientes;
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    clientesWidget = [];
    clientes = [];
    iniciaLista();
  }

  @override
  Widget build(BuildContext context) {
    return carregando
        ? const CircularProgressIndicator()
        : Container(
            height: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 192, 210, 226),
            ),
            width: MediaQuery.of(context).size.width - 20,
            child: ListView(
                scrollDirection: Axis.horizontal, children: clientesWidget),
          );
  }

  iniciaLista() async {
    List<ClientesModel> clientes = widget.contador.clientes!;
    for (int i = 0; i < clientes.length; i++) {
      clientesWidget.add(pastaCliente(clientes[i]));
    }

    setState(() {
      carregando = false;
    });
  }

  pastaCliente(ClientesModel cliente) {
    var cor = const Color.fromRGBO(161, 201, 247, 1);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      borderOnForeground: true,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: InkWell(
        hoverColor: const Color.fromARGB(255, 255, 235, 255),
        onTap: () {
          widget.clienteSelecionado?.value = cliente;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                Icons.folder,
                color: cor,
                size: 100,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  Utils.FormataTextoQuebraDeLinhas(
                      cliente.nome, widget.numeroCaracteres),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      letterSpacing: 1,
                      fontSize: 15,
                      height: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
