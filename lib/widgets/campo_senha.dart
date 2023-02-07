import 'package:flutter/material.dart';
import 'package:portalsped/Classes/Navegacao.dart';
import 'package:portalsped/Models/contadores_model.dart';

// ignore: must_be_immutable
class CustomTextFieldPassword extends StatelessWidget {
  TextEditingController controler;
  ContadoresModel contador;
  CustomTextFieldPassword({
    Key? key,
    required this.controler,
    required this.contador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Card(
            child: TextField(
              autofocus: true,
              onSubmitted: (value) async {
                await Navegacao.telaClientes(
                  usuario: contador,
                  senha: controler.text,
                  context: context,
                );
              },
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
              controller: controler,
            ),
          ),
        ),
      ],
    );
  }
}
