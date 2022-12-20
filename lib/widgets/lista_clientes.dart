import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/clientes.repository.dart';

class ListaClientes extends StatefulWidget {
  ListaClientes({super.key, required this.contador})
  {
     
  }
  
  @override
  final ContadoresModel contador;

  @override
  State<ListaClientes> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ListaClientes> {
  late List<Widget> clientesWidget = [];

  bool carregando = true;

  Widget build(BuildContext context) {
    iniciaLista();
    return carregando ? CircularProgressIndicator() : 
    Container(
      height: 800,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: clientesWidget,
      ),
    );
  }

  iniciaLista() async
  {
    List<ClientesModel> clientes = await ClientesRepository.fetchClientes(contador: widget.contador);
    for(int i=0; i<clientes.length; i++)
    {
      clientesWidget.add(pastaCliente(clientes[i]));
    }
    setState(() {
      carregando = false;
    });
    
  }

  pastaCliente(ClientesModel cliente)
  {
    var cor = const Color.fromRGBO(161, 201, 247, 1);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         SizedBox(
          height: 70,
           child: Icon(Icons.folder,
                 color: cor,
                 size: 50,
                 
                 ),
         ),
        
        SizedBox(
          height: 70,
          child: Text(cliente.nome,
          style: TextStyle(
            height: 50,
            color: cor,
          ),),
        )
      ],
    ) ;
  }
}
