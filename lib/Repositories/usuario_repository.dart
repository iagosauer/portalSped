import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Classes/Valores.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Repositories/clientes_repository.dart';
import 'package:portalsped/Widgets/janela_Dialog.dart';

class UsuarioRepository {
  final dio = Dio();

  Future criaPasta(String pasta, BuildContext context) async {
    try {
      final response = await dio.get('${Valor.baseUrl}/pastas/$pasta');
    } catch (e) {
      JanelaDialog(mensagem: 'Erro ao criar nova pasta$e', mensagemTrue: 'OK')
          .build(context);
    }
  }

  Future<ContadoresModel> verificaLogin(
      String usuario, String senha, BuildContext context) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final snapshot = await firestore.collection('usuarios').get();
  var retorno = ContadoresModel(nome: '');
      for (var x in snapshot.docs) {
        if ((usuario.compareTo(x.get('usuario')) == 0) &&
            (senha.compareTo(x.get('senha')) == 0)) {
          List<ClientesModel> clientes =
              await ClientesRepository().fetchClientes(x.get('pasta'), senha);
         retorno = ContadoresModel(
              nome: x.get('usuario'),
              pasta: x.get('pasta'),
              clientes: clientes);
          
        }      
      }
      return retorno;
    } catch (e) {
      JanelaDialog(mensagem: 'Usuário ou senha incorreta', mensagemTrue: 'OK')
          .build(context);
          throw Exception(e);
    }
  }

  Future<bool> trocaSenha(String usuario, String senhaAtual, String senhaNova,
      BuildContext context) async {
    bool retorno = true;
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      final snapshot =
          await firestore.collection('usuarios').doc(usuario).get();
      if (snapshot.get('senha') == senhaAtual) {
        final fireAtualiza = firestore.collection('usuarios');
        fireAtualiza.doc(usuario).update({'senha': senhaNova});
      } else {
        JanelaDialog(mensagem: 'Senha atual Incorreta', mensagemTrue: 'OK')
            .build(context);
        retorno = false;
      }
    } catch (E) {
      JanelaDialog(mensagem: E.toString(), mensagemTrue: 'OK').build(context);
      retorno = false;
    }

    return retorno;
  }

  Future<List<ClientesModel>> fetchUsuario() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/contadores');
      final lista = jsonDecode(response.data) as List;
      return lista.map((e) => ClientesModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
