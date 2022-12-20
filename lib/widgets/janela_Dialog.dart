// ignore: file_names
import 'package:flutter/material.dart';

class JanelaDialog {
  final String mensagem;
  final String mensagemTrue;
  final String mensagemFalse;
  JanelaDialog(
      {required this.mensagem,
      this.mensagemFalse: '',
      required this.mensagemTrue});

  Future build(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text(mensagem),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              mensagemFalse,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(mensagemTrue),
          ),
        ],
      ),
    );
  }
}