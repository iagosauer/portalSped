import 'package:flutter/material.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Pages/clientes_page.dart';
import 'package:portalsped/Repositories/clientes_repository.dart';
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
      required BuildContext context}) async {
    usuario.clientes = await ClientesRepository().fetchClientes(usuario.nome, senha);

    // ignore: prefer_is_not_empty
    if (!(usuario.clientes!.isEmpty)) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ClientesPage(contador: usuario),
      ));
    } else {
      // ignore: use_build_context_synchronously
      JanelaDialog(mensagem: 'Senha Incorreta', mensagemTrue: 'OK')
          .build(context);
    }
  }
}
