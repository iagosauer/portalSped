import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/widgets/appBar.dart';
import 'package:portalsped/widgets/botao_login.dart';
import 'package:portalsped/widgets/campo_senha.dart';

class LoginPage extends StatefulWidget {
  LoginPage(
      {super.key,
      required this.indice,
      required this.contador,
      required this.cor});
  int indice;
  ContadoresModel contador;
  Color cor;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController controler = TextEditingController(text: '');
    return Scaffold(
      appBar: Appbar.appBar(),
      body: Center(
        child: Dialog(
          backgroundColor: Colors.white,
          child: Hero(
            tag: 'hero-container-${widget.indice}',
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: widget.cor,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ]),
                height: size.height * 0.62,
                width: size.width * 0.37,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      widget.contador.nome,
                      style: TextStyle(
                          fontSize: size.height * 0.06,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            textAlign: TextAlign.start,
                            'Senha',
                            style: TextStyle(
                                fontSize: size.height * 0.03,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.008,
                    ),
                    CustomTextFieldPassword(controler: controler,
                    contador: widget.contador,),
                    SizedBox(
                      height: size.height * 0.008,
                    ),
                    BotaoLogin(
                      contador: widget.contador,
                      controler: controler,
                      size: size,
                    ),
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
