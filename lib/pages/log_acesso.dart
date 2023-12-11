// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:js_util';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portalsped/Models/clientes_model.dart';
import 'package:portalsped/Models/logs_model.dart';
import 'package:portalsped/Repositories/contadores_repository.dart';
import 'package:intl/intl.dart';
import 'package:portalsped/Widgets/appBar.dart';

class LogsAcesso extends StatefulWidget {
  LogsAcesso({super.key});

  @override
  State<LogsAcesso> createState() => _LogsAcessoState();
}

class _LogsAcessoState extends State<LogsAcesso> {
  late List<LogsModel> logs;
  late List<Widget> logsWidgets;
  bool carregando = true;
  @override
  void initState() {
    super.initState();
    iniciaLista();
  }

  @override
  Widget build(BuildContext context) {
    return carregando
        ? const CircularProgressIndicator()
        : Scaffold(
            appBar: Appbar.appBarManutencao(context),
            body: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 192, 210, 226),
              ),
              width: MediaQuery.of(context).size.width - 20,
              child: ListView(
                  scrollDirection: Axis.vertical, children: logsWidgets),
            ),
          );
  }

  iniciaLista() async {
    setState(() {
      carregando = true;
    });
    //var comp = MediaQuery.of(context).size.width;
    logs = await ContadoresRepository().fecthLogs(context);
    logsWidgets = [];
    for (var element in logs) {
      var milis = element.data.millisecondsSinceEpoch;
      var data = DateTime.fromMillisecondsSinceEpoch(milis);

      logsWidgets.add(
        Container(
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Expanded(
                child: Text(
                  element.escritorio,
                  style: GoogleFonts.prompt(
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
          
                child: Text(
                  DateFormat('dd/MM/yyyy, HH:mm').format(data),
                  style: GoogleFonts.prompt(
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start  
                ),
              ),
            ]),
          ),
        ),
      );
    }
    setState(() {
      carregando = false;
    });
  }
}
