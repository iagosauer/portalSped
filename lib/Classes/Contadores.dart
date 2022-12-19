import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'dart:math' as math;

class Contadores {
  static createListaContadores() {
    List<CardContadores> lista = [];
    List<String> contadores = [
      'Escritório Jupiter',
      'Escritório Portal',
      'Escritório Conde',
      'Escritório Contabilidade'
    ];


    for (int i = 0; i < contadores.length; i++) {
      lista.add(CardContadores(indice: i, contador: contadores[i])
        );
    }
    return lista;
  }
}

class CardContadores extends StatefulWidget {
  CardContadores({super.key,
  required this.indice,
  required this.contador
  });
  int indice;
  String contador;

    List<Color> cores = [
      const Color.fromRGBO(230, 26, 90, 1),
      const Color.fromRGBO(255, 186, 9, 1),
      const Color.fromRGBO(0, 139, 124, 1)
    ];




  @override
  State<StatefulWidget> createState() => _StateCardContadores();
}

class _StateCardContadores extends State<CardContadores> {
  @override
  Widget build(BuildContext context) {

    
    return Container(
        child: Transform(
          transform: Matrix4.rotationX(0),
          child: Container(
            child: Card(
                shadowColor: const Color.fromRGBO(0, 0, 0, 1),
                color: widget.cores[widget.indice % 3],
                elevation: 10,
                child: InkWell(
                  child: Center(
                    child: Text(
                      widget.contador,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'Inter'),
                    ),
                  ),
                  onTap: () {
                    log(widget.contador);
                  },
                )),
          ),
        ),
      );
  }


}







/*
  funcao(int indice, String contador)
  {



  }



*/