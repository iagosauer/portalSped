import 'package:flutter/material.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Widgets/appBar.dart';
import 'package:portalsped/Widgets/lista_clientes.dart';

// ignore: must_be_immutable
class ClientesPage extends StatefulWidget {
  ContadoresModel contador;
  ClientesPage({super.key, required this.contador});

  @override
  State<ClientesPage> createState() => _ClientesPage();
}

class _ClientesPage extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar(),
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
                        child: Card(
                          elevation: 20,
                          child: ListaClientes(contador: widget.contador),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
