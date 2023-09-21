import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:portalsped/Models/contadores_model.dart';
import 'package:portalsped/Classes/Valores.dart';
import 'package:portalsped/Models/logs_model.dart';
import 'package:portalsped/Widgets/janela_Dialog.dart';

class ContadoresRepository {
  final dio = Dio();

  Future <List<LogsModel>> fecthLogs(BuildContext context) async{
    List<LogsModel> logs = [];
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final snapshot = await firestore.collection('logs').get();
      var x;
      for (x in snapshot.docs) {
        logs.add(
          LogsModel(
              data: x.get('data'),
              escritorio: x.get('escritorio'),
          ),
        );
      }
    } catch (E) {
      JanelaDialog(mensagem: E.toString(), mensagemTrue: 'OK').build(context);
    }
    return logs;
  }

  Future<List<ContadoresModel>> fetchUsuario() async {
    try {
      final response = await dio.get('${Valor.baseUrl}/contadores');
      final lista = jsonDecode(response.data) as List;
      return lista.map((e) => ContadoresModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

    Future<List<String>> fetchPastas() async {
    try {
      final response = await dio.post('${Valor.baseUrl}/contadores',
      data: {"nome": "","cliente": "","path": ""});
      final lista = response.data as List;
      return lista.map((e) => e['nome'] as String).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

    static Future<bool> adicionaContador(
    String usuario,
    String senha,
    String pasta,
  ) async
  { 
    bool retorno = true;
    try{
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final snapshot = firestore.collection('usuarios').doc(usuario);
      snapshot.set({'usuario': usuario,
      'senha': senha,
      'pasta' : pasta});
    }catch (e)
    {
      retorno = false;
      JanelaDialog(mensagem: 'Não foi possível realizar o cadastro: $e'
      , mensagemTrue: 'ok');
    }
    return retorno;
  }

  static Future<bool> updateContador(
    String usuario,
    String senha,
    String pasta,
  ) async
  { 
    bool retorno = true;
    try{
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      final snapshot = firestore.collection('usuarios').doc(usuario);
      snapshot.update({'senha':senha,
      'pasta' : pasta});
    }catch (e)
    {
      retorno = false;
      JanelaDialog(mensagem: 'Não foi possível realizar o cadastro: $e'
      , mensagemTrue: 'ok');
    }
    return retorno;
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
