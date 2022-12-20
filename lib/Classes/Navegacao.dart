import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Pages/clientes_page.dart';
import 'package:portalsped/Repositories/usuario.repository.dart';
import 'package:portalsped/Widgets/janela_Dialog.dart';
import 'package:portalsped/pages/login_page.dart';

class Navegacao {
  static telaLogin(
      {required BuildContext context,
      required int indice,
      required ContadoresModel contador,
      required Color cor}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginPage(
          indice: indice,
          contador: contador,
          cor: cor,
        ),
      ),
    );
  }

  static telaClientes(
    {required ContadoresModel usuario,
    required String senha,
    required BuildContext context }
  ) async
  {
    var retorno = UsuarioRepository.fetchLogin(login: usuario.nome, senha: senha);
    if(await retorno)
    {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ClientesPage(contador: usuario),
        )
      );
    }
    else
    {
      JanelaDialog(mensagem: 'Senha Incorreta', mensagemTrue: 'OK').build(context);
    }


  }
}
