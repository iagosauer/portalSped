// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/clientes.repository.dart';

class ListaClientes extends StatefulWidget {
  ListaClientes({super.key, required this.contador});

  final ContadoresModel contador;
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

  Widget build(BuildContext context) {
    return carregando
        ? const CircularProgressIndicator()
        : Container(
            height: 200,
            width: double.infinity,
            child: ListView(
                scrollDirection: Axis.horizontal, children: clientesWidget),
          );
  }

  iniciaLista() async {
    List<ClientesModel> clientes =
        await ClientesRepository.fetchClientes(contador: widget.contador);
    for (int i = 0; i < clientes.length; i++) {
      clientesWidget.add(pastaCliente(clientes[i]));
    }
    setState(() {
      carregando = false;
    });
  }

  pastaCliente(ClientesModel cliente) {
    var cor = const Color.fromRGBO(161, 201, 247, 1);
    return InkWell(
      onTap: () {},
      onHover: (value) {},
      child: SizedBox(
        height: 200,
        child: Card(
          elevation: 20,
          child: Column(
            children: [
              Card(
                child: Icon(
                  Icons.folder,
                  color: cor,
                  size: 150,
                ),
              ),
              Card(
                child: Text(
                  cliente.nome,
                  style: TextStyle(
                      shadows: [
                        const Shadow(color: Colors.black, blurRadius: 0.3)
                      ],
                      fontSize: 20,
                      height: 1,
                      color: cor,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
