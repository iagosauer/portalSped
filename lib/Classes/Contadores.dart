import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Contadores {

  static createListaContadores()
  {
    List<FlipCard> lista = [];
    List<String> contadores = [
      'Escritório Jupiter',
      'Escritório Portal',
      'Escritório Conde',
      'Escritório Contabilidade'

    ];
    List<Color> cores = [const Color.fromRGBO(230, 26, 90, 1),
    const Color.fromRGBO(255, 186, 9, 1),
    const Color.fromRGBO(0, 139, 124, 1) ];

    for(int i = 0; i<contadores.length; i++)
    {
      lista.add(
        FlipCard(
          
         back: Card(),
         front: Card(
            shadowColor: const Color.fromRGBO(0, 0, 0, 1),
            color: cores[i%3],
            elevation: 10,
            child: InkWell(
              child:Center(
                child:Text(contadores[i],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontFamily: 'Inter'
                                     ),       
                                ),
                          ),
              onTap: () {
                log(contadores[i]);
              }, 
            ) 
          ),
        )
      );
    }
    return lista;
  }

}