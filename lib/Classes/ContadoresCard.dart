import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:portalsped/Classes/navegacao.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'dart:math' as math;

import 'package:portalsped/Pages/login_page.dart';
import 'package:portalsped/Repositories/contadores_repository.dart';

class ContadoresCard {
  static createListaContadores() async {
    List<Widget> lista = [];
    var contadores = await ContadoreRepository.getContadores();

    for (int i = 0; i < contadores.length; i++) {
      lista.add(
        Hero(
          tag: 'hero-container-$i',
          child: CardContadores(indice: i, contador: contadores[i]),
        ),
      );
    }
    return lista;
  }
}

class CardContadores extends StatefulWidget {
  CardContadores({super.key, required this.indice, required this.contador});
  int indice;
  ContadoresModel contador;

  List<Color> cores = [
    const Color.fromRGBO(230, 26, 90, 1),
    const Color.fromRGBO(255, 186, 9, 1),
    const Color.fromRGBO(0, 139, 124, 1)
  ];
  @override
  State<StatefulWidget> createState() => _StateCardContadores();
}

class _StateCardContadores extends State<CardContadores> {
  double x = 0;
  double y = 1;
  double z = 0;
  Tween animacao = Tween(begin: 0, end: 500);

  _abreTelaSenha() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        alignment: Alignment.center,
        actions: [
          Hero(
            tag: 'hero-container-0',
            child: Center(
              child: Container(
                height: 500,
                width: 500,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.contador.nome,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromRGBO(0, 0, 0, 1),
      color: widget.cores[widget.indice % 3],
      elevation: 10,
      child: InkWell(
        child: Center(
          child: Text(
            widget.contador.nome,
            style: const TextStyle(
                color: material.Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'Inter'),
          ),
        ),
        onTap: () {
          Navegacao.telaLogin(
              context: context,
              indice: widget.indice,
              contador: widget.contador,
              cor: widget.cores[widget.indice % 3]);
        },
      ),
    );
  }
}
