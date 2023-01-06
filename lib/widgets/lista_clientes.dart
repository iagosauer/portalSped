// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/clientes_repository.dart';

class ListaClientes extends StatefulWidget {
  ListaClientes({super.key, required this.contador});

  final ContadoresModel contador;
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
            height: 220,
            decoration:  const BoxDecoration(
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
    /*
    List<ClientesModel> clientes =
        await ClientesRepository.fetchClientes(contador: widget.contador);
        */
    for (int i = 0; i < clientes.length; i++) {
      clientesWidget.add(pastaCliente(clientes[i]));
    }
    setState(() {
      carregando = false;
    });
  }

  pastaCliente(ClientesModel cliente) {
    var cor =const Color.fromRGBO(161, 201, 247, 1);
    return Card(
      elevation: 20,
      borderOnForeground: true,
      color: Color.fromARGB(255, 255, 255, 255),
      child: InkWell(
        hoverColor: const Color.fromARGB(255, 255, 235, 255),
        onTap: () {
          log(cliente.nome);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                Icons.folder,
                color: cor,
                size: 150,
              ),
                Text(
                  cliente.nome,
                  style: GoogleFonts.inter(
                    letterSpacing: 2,
                      fontSize: 20,
                      height: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
