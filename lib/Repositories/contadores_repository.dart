import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Classes/Valores.dart';
import 'package:portalsped/Widgets/janela_Dialog.dart';

class ContadoresRepository {
  final dio = Dio();

  Future<List<ContadoresModel>> fetchUsuario() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/contadores');
      final lista = jsonDecode(response.data) as List;
      return lista.map((e) => ContadoresModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<ContadoresModel>> BuscaContadores(
      BuildContext context) async {
    List<ContadoresModel> contadores = [];
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final snapshot = await firestore.collection('usuarios').get();
      var x;
      for (x in snapshot.docs) {
        contadores.add(
          ContadoresModel(
            nome: x.get('usuario'),
            clientes: [],
            pasta: x.get('pasta'),
            senha: x.get('senha'),
          ),
        );
      }
    } catch (E) {
      JanelaDialog(mensagem: E.toString(), mensagemTrue: 'OK').build(context);
    }
    return contadores;
  }
}
