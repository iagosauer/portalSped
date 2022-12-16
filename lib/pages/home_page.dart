import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:portalsped/Classes/Contadores.dart';
import 'package:portalsped/widgets/appBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar.appBar(),
      body: const PaginaInicial(),
    );
  }
}


class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});
  
  @override
  State<StatefulWidget> createState() => _MyHomePage();

}

class _MyHomePage extends State<PaginaInicial> {

  final double padding = 20;

  @override
  Widget build(BuildContext context) {

    return GridView(
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.0,
              ),
            children: Contadores.createListaContadores(),
            padding: EdgeInsets.all(padding),
    );
  }


  
}