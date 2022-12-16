import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      body: PaginaInicial(),
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
            children: createListaContadores(padding),
            padding: EdgeInsets.all(padding),
    );
  }


  createListaContadores(double padding)
  {
    final double largura = (MediaQuery.of(context).size.width - (2*padding)) / 3;
    List<SizedBox> lista = [];
    List<Color> cores = [Color.fromRGBO(230, 26, 90, 1),
    Color.fromRGBO(255, 186, 9, 1),
    Color.fromRGBO(0, 139, 124, 1) ];

    for(int i = 0; i<12; i++)
    {
      lista.add(
        SizedBox(
          width: largura,
          height: 10.0,
          child: Card(
            shadowColor: Color.fromRGBO(0, 0, 0, 1),
            color: cores[i%3],
            elevation: 10,
            child: InkWell(
              child:Center(child: Text('Contador: $i')),
              onTap: () {
                log('Contador: $i');
              }, 
            ) 
          ),
        )
      );
    }
    return lista;
  }
}