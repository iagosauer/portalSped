import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portalsped/Models/documentos_model.dart';

class LogsModel {
  LogsModel({required this.escritorio, required this.data});
  final String escritorio;
  final Timestamp data;


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': escritorio,
      'filhos': data,
    };
  }

  factory LogsModel.fromMap(Map<String, dynamic> map) {
    return LogsModel(
      escritorio: map['escritorio'] as String,
      data : map['data'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogsModel.fromJson(String source) =>
      LogsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
