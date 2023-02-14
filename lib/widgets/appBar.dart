import 'package:flutter/material.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/pages/editaCliente.dart';

class Appbar {
  static appBarManutencao(BuildContext context) {
    ContadoresModel contador = ContadoresModel(nome: '');
    ContadoresModel contadorAdmin = ContadoresModel(nome: 'portalAdmin');
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Image.asset('assets/imagens/icone.png'),
      ),
      title: const Text(
        'Central de Arquivos SPED',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
      ),
      actions: [
        PopupMenuButton(onSelected: ((value) {
          if (value == 0) {
            Navigator.of(context).pushNamed(
              '/editar',
              arguments: ArgumentsEditar(contador, contadorAdmin),
            );
          } else if (value == 1) {
            Navigator.of(context).pushNamed('/');
          }
        }), itemBuilder: ((context) {
          return [
            const PopupMenuItem(
              value: 0,
              child: Text('Cadastrar Novo Escritório'),
            ),
            const PopupMenuItem(
              value: 1,
              child: Text('Sair'),
            ),
          ];
        }))
      ],
    );
  }

  static appBar(ContadoresModel contador, BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Image.asset('assets/imagens/icone.png'),
      ),
      title: const Text(
        'Central de Arquivos SPED',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
      ),
      actions: [
        PopupMenuButton(onSelected: ((value) {
          if (value == 0) {
            Navigator.of(context).pushNamed('/trocaSenha', arguments: contador);
          } else if (value == 1) {
            Navigator.of(context).pushNamed('/clientes', arguments: contador);
          } else if (value == 2) {
            Navigator.of(context).pushNamed('/');
          }
        }), itemBuilder: ((context) {
          return [
            const PopupMenuItem(
              value: 0,
              child: Text('Trocar Senha'),
            ),
            const PopupMenuItem(
              value: 1,
              child: Text('Visualizar Clientes'),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text('sair'),
            )
          ];
        }))
      ],
    );
  }
}
