import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portalsped/Classes/Contadores.dart';
import 'package:portalsped/widgets/botao_login.dart';
import 'package:portalsped/widgets/campo_senha.dart';

class LoginPage extends StatelessWidget {
  LoginPage(
      {super.key,
      required this.indice,
      required this.contador,
      required this.cor});
  int indice;
  String contador;
  Color cor;

  @override
  Widget build(BuildContext context) {
    TextEditingController controler = TextEditingController(text: '');
    return Scaffold(
      body: Center(
        child: Dialog(
          backgroundColor: Colors.white,
          child: Hero(
            tag: 'hero-container-$indice',
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: cor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: const [
                    BoxShadow(offset: Offset(4,4), blurRadius: 10,),
                  ]
                ),
                height: 400,
                width: 500,                
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      contador,
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            textAlign: TextAlign.start,
                            'Senha',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height:5,
                    ),
                    CustomTextFieldPassword(controler: controler),
                    const SizedBox(
                      height:5,
                    ),
                    BotaoLogin(controler: controler),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
