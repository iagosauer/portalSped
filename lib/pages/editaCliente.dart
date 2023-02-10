import 'package:flutter/material.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Widgets/Text.dart';
import 'package:portalsped/Widgets/appBar.dart';

class EditaCliente extends StatefulWidget {
    EditaCliente({super.key,
  required this.contador});
  ContadoresModel contador;


  @override
  State<EditaCliente> createState() => _EditaClienteState();
}

class _EditaClienteState extends State<EditaCliente>{


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: Appbar.appBarManutencao(context),
        body: Center(
          child: Container(
            child: Column(children: [
              TextFormat(texto: 'Nome do Usuário:'),
              
              
            ]),
          ),
        ),

      );
  }



}