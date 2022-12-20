
import 'package:flutter/material.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Widgets/appBar.dart';
import 'package:portalsped/Widgets/lista_clientes.dart';

// ignore: must_be_immutable
class ClientesPage extends StatefulWidget{
  ContadoresModel contador;
  ClientesPage({super.key,
  required this.contador});


  @override
  State<ClientesPage> createState() => _ClientesPage();

}

class _ClientesPage extends State<ClientesPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          children: [
                ListaClientes(contador: widget.contador),
                Container(),
          ]
        ),
      ),


    );
  }


}