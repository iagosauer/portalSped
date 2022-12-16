import 'package:flutter/material.dart';

class Appbar {

  static appBar()
  {
    return AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/imagens/icone.png'),
        ),
        title: const Text('Central de Arquivos SPED',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
        ),
      );
  }
}